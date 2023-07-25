
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 15
        ENV PATH="/app/15/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.21.dev0" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['8857', '8852', '8853', '8859', '8861', '8865', '8854', '8867', '8758', '8855', '8864', '8756', '8858', '8759', '8863', '8856'])" ]
        