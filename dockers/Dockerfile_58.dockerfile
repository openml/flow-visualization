
        FROM python:3.8

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 58
        ENV PATH="/app/58/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==1.2.1" "numpy>=1.17.3" "scipy>=1.3.2" "joblib>=1.1.1" "threadpoolctl>=2.0.0" skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19330', '19437', '19331', '19438', '19333', '19332', '19436'])" ]
        