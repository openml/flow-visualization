
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 20
        ENV PATH="/app/20/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.22.dev0" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['17367', '17354', '17352', '17324', '17283', '12126', '17284', '17353', '17321', '12131', '17366', '17281', '17313', '17359', '12127', '17280', '12125', '17316', '17286', '17360', '17355', '12132', '17368', '17320', '17319', '17362', '17327', '17351', '17356', '17361', '17322', '17318', '17323', '17282', '17317', '17285', '17365', '17315', '17326'])" ]
        