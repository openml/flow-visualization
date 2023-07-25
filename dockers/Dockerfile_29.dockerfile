
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 29
        ENV PATH="/app/29/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.23.1" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['18721', '18707', '18778', '18781', '18597', '18584', '18706', '18596', '18586', '18758', '18722', '18587', '18710', '18776', '18598', '18708', '18703', '18711', '18585', '18774', '18724', '18594', '18720', '18780', '18779', '18595', '18605', '18688', '18714', '18777', '18599', '18612', '18689', '18715', '18716', '18775', '18712', '18604', '18709', '18603', '18606', '18713', '18723'])" ]
        