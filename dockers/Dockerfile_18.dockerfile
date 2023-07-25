
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 18
        ENV PATH="/app/18/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.20.2" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['17499', '9550', '8894', '17496', '8924', '8891', '8919', '9674', '8892', '17500', '8909', '8895', '9551', '9554', '8918', '9673', '8896', '9552', '8921', '8947', '17498', '9502', '8889', '9576', '9577', '8948', '8929', '8943', '8897', '8930', '8899', '8945', '8910', '8888', '8946', '9574', '9590', '9598', '8911', '8893', '9589', '8890', '9575', '9503', '8887', '8898', '8904', '9573', '9553', '9675', '8928', '8906', '9555', '17497', '8905'])" ]
        