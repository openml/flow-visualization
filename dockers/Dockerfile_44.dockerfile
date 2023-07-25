
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 44
        ENV PATH="/app/44/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.20.3" "numpy>=1.8.2" "scipy>=0.13.3" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19209', '19205', '19208', '19210', '19200', '19206', '19204', '19201', '19202', '18989', '19203', '19207', '19211'])" ]
        