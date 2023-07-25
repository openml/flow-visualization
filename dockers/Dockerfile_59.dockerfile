
        FROM python:3.8

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 59
        ENV PATH="/app/59/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==1.2.2" "numpy>=1.17.3" "scipy>=1.3.2" "joblib>=1.1.1" "threadpoolctl>=2.0.0" skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19403', '19348', '19357', '19378', '19428', '19362', '19377', '19405', '19387', '19407', '19454', '19431', '19350', '19411', '19373', '19401', '19343', '19389', '19415', '19370', '19422', '19427', '19365', '19375', '19400', '19355', '19429', '19376', '19426', '19406', '19368', '19408', '19352', '19364', '19404', '19346', '19402', '19425', '19423', '19363', '19344', '19385', '19414', '19358', '19384', '19347', '19354', '19345', '19412', '19388', '19455', '19351', '19367', '19390', '19360', '19420', '19371', '19381', '19383', '19417', '19374', '19416', '19379', '19386', '19353', '19359', '19413', '19419', '19430', '19380', '19424', '19372', '19361', '19366', '19382', '19453', '19349', '19356', '19369', '19421', '19409', '19418', '19410'])" ]
        