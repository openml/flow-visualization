
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 31
        ENV PATH="/app/31/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.24.0" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['18764', '18730', '18765', '18762', '18766', '18785', '18768', '18784', '18767'])" ]
        