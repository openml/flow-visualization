# Visualizing openML flows

This repository provides an initial attempt at visualizing flows. Generally, this should work in three steps:
1. Retrieve the pipeline/model from the openML flow.
2. Convert the model to onnx format.
3. Load the onnx model through [netron](https://github.com/lutzroeder/netron).

The current trial version is restricted to visualizing *scikit-learn* flows.

## Usage

1. Setting up your environment
   ```
   cd .
   pip install -r requirements.txt
   ```
2. ```implementation.csv``` provides an overview of all distinct configurations found among openML flows. Run ```retrieve_sklearn_version.py``` in order to generate a docker for every distinct sklearn configuration found. Dockerfiles are stored in ```./dockers``` (59 distinct configurations found).
3. Running a docker will call ```sk_onnx.py``` or ```sk_onnx_old.py```, depending on the sklearn version used. This script will convert all flows that are built using that specific sklearn version to onnx files. Files will be stored in ```./onnx_models```.
4. Once you have the onnx file stored, you can visualize it using netron. A function to do so is provided in ```sk_onnx.visualize_onnx```.
   
Keep in mind that there are currently multiple bugs in the code that need fixing. There are also multiple to-do's (such as integrating netron in the openML website). Find elaborate documentation on limitations and future work in text.pdf.

## Additional Files
A small Flask app is provided to show how netron can be used to visualize onnx models. This can be done by either loading a stored file or directly via url. Running the Flask app will call ```sk_onnx_test.py``` which allows you to visualize flow 19433:
```
cd .
flask run
```
## Contact
Feel free to reach out to me (t.a.boot@outlook.com) in case of questions!
