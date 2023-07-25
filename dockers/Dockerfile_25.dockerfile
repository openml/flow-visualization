
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 25
        ENV PATH="/app/25/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.23.dev0" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['17370', '17501', '17638', '17371', '17369', '17641', '17635', '17373', '17374', '17640', '17636', '17637', '17372', '17642'])" ]
        