
        FROM python:3.8

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 57
        ENV PATH="/app/57/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==1.2.1" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19326', '19325'])" ]
        