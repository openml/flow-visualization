from flask import Flask, render_template,  redirect, url_for
import netron
import os
import urllib.request
import webbrowser
import argparse

browser_path = '/mnt/c/Program Files/Google/Chrome/Application/crhome.exe'
os.environ["BROWSER"] = browser_path

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/execute', methods=['POST'])
def execute():
    import sk_onnx_test
    return redirect(url_for('index'))

@app.route("/execute_online", methods=['POST'])
def execute_online():
    full_url = "https://netron.app/?url="+'https://media.githubusercontent.com/media/onnx/models/main/vision/classification/squeezenet/model/squeezenet1.0-3.onnx'
    webbrowser.open(full_url)
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(port=5700)
