
        FROM python:3.8

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 51
        ENV PATH="/app/51/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==1.2.dev0" "numpy>=1.17.3" "scipy>=1.3.2" "joblib>=1.0.0" "threadpoolctl>=2.0.0" skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19119', '19120', '19123', '19122', '19121'])" ]
        