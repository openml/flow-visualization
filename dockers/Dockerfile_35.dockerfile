
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 35
        ENV PATH="/app/35/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.24.2" "numpy>=1.13.3" "scipy>=0.19.1" "joblib>=0.11" "threadpoolctl>=2.0.0" skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19002', '19037', '18998', '19025', '19010', '19001', '19003', '19107', '18819', '18991', '18812', '18997', '18818', '19019', '18999', '19278', '19012', '19005', '19008', '19013', '19027', '19106', '18813', '19016', '18814', '19015', '18996', '19000', '19024', '19090', '19014', '19023', '19011', '19026', '19149', '19105', '19004', '19009', '18820', '19007', '19006', '19038', '18995', '19018', '19017'])" ]
        