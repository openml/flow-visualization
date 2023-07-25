
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 30
        ENV PATH="/app/30/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.23.2" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['18770', '18725', '18699', '18771', '18783', '18745', '18769', '18747', '18719', '18748', '18749', '18686', '18718', '18782', '18695', '18717', '18701', '18773', '18698', '18700', '18697', '18687', '18702', '18685', '18746', '18683', '18772', '18696', '18684'])" ]
        