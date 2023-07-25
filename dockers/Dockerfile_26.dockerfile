
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 26
        ENV PATH="/app/26/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.22" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['17455', '18592', '17456', '17459', '17457', '17461', '17473', '17474', '17460', '17458'])" ]
        