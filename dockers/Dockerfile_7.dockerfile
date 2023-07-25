
        FROM python:3.6

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 7
        ENV PATH="/app/7/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.18" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['5868', '18864', '5875', '5876', '5869', '5620', '5648', '5501', '5872', '18862', '18866', '5867', '5863', '5862', '5870', '6650', '5642', '5650', '5651', '18865', '5864', '18867', '6649', '5874', '5877', '5866', '5865', '18863', '18868', '5873', '5861', '5871', '6651'])" ]
        