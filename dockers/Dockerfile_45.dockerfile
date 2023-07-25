
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 45
        ENV PATH="/app/45/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.21.0" "numpy>=1.11.0" "scipy>=0.17.0" "joblib>=0.11" threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19228', '19233', '19231', '19225', '19224', '19227', '18990', '19226', '19229', '19232', '19230'])" ]
        