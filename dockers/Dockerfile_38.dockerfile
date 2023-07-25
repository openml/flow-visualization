
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 38
        ENV PATH="/app/38/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.21.3" "numpy>=1.11.0" "scipy>=0.17.0" "joblib>=0.11" threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['18859', '18860'])" ]
        