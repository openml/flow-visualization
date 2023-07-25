
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 34
        ENV PATH="/app/34/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.24.1" "numpy>=1.13.3" "scipy>=0.19.1" "joblib>=0.11" "threadpoolctl>=2.0.0" skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['18843', '18844', '18795', '18794', '18845', '18797', '18793', '18841', '18842', '19151', '18791', '19102', '18796'])" ]
        