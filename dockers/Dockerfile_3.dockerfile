
        FROM python:3.6

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 3
        ENV PATH="/app/3/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.18.dev0" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['3721', '3719', '3724', '3425', '2856', '3723', '3453', '3720', '3439', '3445', '3716', '3446', '3434', '3717', '4074', '2823', '3718', '3722'])" ]
        