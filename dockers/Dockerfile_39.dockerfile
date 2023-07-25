
        FROM python:3.6

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 39
        ENV PATH="/app/39/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.19.0" "numpy>=1.8.2" "scipy>=0.13.3" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['18923', '18922', '18924'])" ]
        