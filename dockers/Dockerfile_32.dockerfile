
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 32
        ENV PATH="/app/32/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.24.1" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['18761', '18756', '18786', '18787', '18744'])" ]
        