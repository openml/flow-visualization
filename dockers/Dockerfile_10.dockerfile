
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 10
        ENV PATH="/app/10/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.20.dev0" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['7262', '7260', '7278', '7264', '7259', '7261', '7263'])" ]
        