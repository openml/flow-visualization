
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 36
        ENV PATH="/app/36/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.22.2.post1" "numpy>=1.11.0" "scipy>=0.17.0" "joblib>=0.11" threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['18852', '18847', '18840', '18855', '18857', '18816', '18838', '18837', '18849', '18851', '18854', '18848', '18839', '18850', '18858', '18836'])" ]
        