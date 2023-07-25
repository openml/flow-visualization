
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 28
        ENV PATH="/app/28/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.22.2.post1" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['17644', '17634', '17607', '18593', '18757', '18142', '17609', '17608', '17610', '17633', '17632', '19118', '17688', '17639', '17693', '17643', '17611'])" ]
        