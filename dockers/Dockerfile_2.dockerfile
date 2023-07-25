
        FROM python:3.6

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 2
        ENV PATH="/app/2/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.17.1" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['3404', '3436', '2799', '4706', '4853', '3440', '5442', '3444', '3442', '5444', '3455', '3482', '3415'])" ]
        