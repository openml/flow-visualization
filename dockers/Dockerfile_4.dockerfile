
        FROM python:3.6

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 4
        ENV PATH="/app/4/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.18" "numpy>=1.6.1" "scipy>=0.9.0" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['5450', '5432', '4978', '5447', '4977', '4834', '4830', '4835'])" ]
        