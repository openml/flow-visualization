
        FROM python:3.6

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 5
        ENV PATH="/app/5/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.18.1" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['5496', '5446', '5430', '5498', '5451', '5495', '5497', '5431', '4855', '5445'])" ]
        