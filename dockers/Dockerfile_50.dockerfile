
        FROM python:3.8

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 50
        ENV PATH="/app/50/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==1.1.1" "numpy>=1.17.3" "scipy>=1.3.2" "joblib>=1.0.0" "threadpoolctl>=2.0.0" skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19237', '19319', '19222', '19234', '19323', '19312', '19116', '19321', '19235', '19315', '19223', '19316', '19320', '19117', '19236', '19115', '19324', '19313', '19148', '19238', '19314', '19317', '19239', '19318', '19322', '19221'])" ]
        