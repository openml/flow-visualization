
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 33
        ENV PATH="/app/33/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.23.1" "numpy>=1.13.3" "scipy>=0.19.1" "joblib>=0.11" "threadpoolctl>=2.0.0" skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['18788', '18790', '18789'])" ]
        