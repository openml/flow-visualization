
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 52
        ENV PATH="/app/52/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.21.1" "numpy>=1.11.0" "scipy>=0.17.0" "joblib>=0.11" threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19219', '19217', '19213', '19218', '19142', '19214', '19216', '19143', '19212', '19215', '19144'])" ]
        