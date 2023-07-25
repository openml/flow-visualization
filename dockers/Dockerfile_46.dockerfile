
        FROM python:3.8

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 46
        ENV PATH="/app/46/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==1.0.1" "numpy>=1.14.6" "scipy>=1.1.0" "joblib>=0.11" "threadpoolctl>=2.0.0" skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19033', '19030', '19045', '19099', '19031', '19036', '19039', '19035', '19070', '19071', '19100', '19101', '19034', '19032', '19040'])" ]
        