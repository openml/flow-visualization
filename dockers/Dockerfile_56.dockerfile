
        FROM python:3.8

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 56
        ENV PATH="/app/56/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==1.2.0" "numpy>=1.17.3" "scipy>=1.3.2" "joblib>=1.1.1" "threadpoolctl>=2.0.0" skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19276', '19275', '19273', '19255', '19240', '19242', '19272', '19253', '19254', '19277', '19274', '19244', '19243', '19252', '19241'])" ]
        