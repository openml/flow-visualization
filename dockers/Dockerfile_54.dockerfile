
        FROM python:3.8

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 54
        ENV PATH="/app/54/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==1.0" "numpy>=1.14.6" "scipy>=1.1.0" "joblib>=0.11" "threadpoolctl>=2.0.0" skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19191', '19190'])" ]
        