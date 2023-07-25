import numpy as np
import pandas as pd
import csv
import os
from collections import defaultdict

def retrieve_sklearn_versions(path_to_file):
    
    dependency_sets = defaultdict(set)

    if not path_to_file.endswith('.csv'):
        raise ValueError(f"The file {path_to_file} is not a csv file.")
    
    df = pd.read_csv(path_to_file)
    # print(df.columns)
    filtered_df = df[df['fullName'].str.contains('sklearn', case=False)]
    # print("Number of flows:", len(filtered_df))
    for index, row in filtered_df.iterrows():
        flow_id = str(row['id'])
        dependencies = row['dependencies']
        if not isinstance(dependencies, str) or not 'sklearn' in dependencies.lower():
            dependencies = row['external_version']
        dependencies = clean_dependencies(dependencies, 'sklearn')
        dependency_sets[dependencies].add(flow_id)

    return dependency_sets

def clean_dependencies(string, sequence):
    index = string.find(sequence)
    if index != -1:
        string = string[index:]
    else:
        string = string
    string = string.replace("_", "==") #needed for docker to install properly
    string_noline = string.replace("\n", "\" \"") #place each dependency between brackets in order for the docker to properly install the package
    string_bracket = "\"" + string_noline + "\""
    string_complete = string_bracket.replace("sklearn", "scikit-learn") #rename for pip install
    return string_complete

def define_python(dependency):
    index = dependency.find("scikit-learn")
    if index != -1: #Make sure sklearn is an actual package
        package_version_index = index + len("scikit-learn") + 2
        package_version = dependency[package_version_index:package_version_index+3] #check if the package uses sklearn 0.X or 1.X
        # print(package_version)
        if package_version[0] == "0":
            if package_version[2] == "2":
                return "3.7"
            return "3.6" #older python version
    return "3.8" #newer python version
    
def make_dockers(save_dir):
    sets = retrieve_sklearn_versions('implementation.csv')
    index = 0
    for dependency, flows in sets.items():
        if not "scikit-learn" in dependency:
            continue
        if not "numpy" in dependency:
            dependency = dependency + " " + "\"numpy>=1.6.1\""
        if not "scipy" in dependency:
            dependency = dependency + " " + "\"scipy>=0.9\""
        if not "joblib" in dependency:
            dependency = dependency + " joblib"
        if not "threadpoolctl" in dependency:
            dependency = dependency + " threadpoolctl"
        dependency = dependency + " skl2onnx netron openml"
        python_version = define_python(dependency)
        flow_ids = list(flows)
        
        dockerfile_content = f"""
        FROM python:{python_version}

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv {index}
        ENV PATH="/app/{index}/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install {dependency}
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx({flow_ids})" ]
        """
        # Write Dockerfile to a file
        path = os.path.join(save_dir, f"Dockerfile_{index}.dockerfile")
        with open(path, 'w') as dockerfile:
            dockerfile.write(dockerfile_content)
        
        index+=1

make_dockers('dockers')