
        FROM python:3.6

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 13
        ENV PATH="/app/13/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.19.2" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['10590', '8658', '8740', '17451', '8656', '8750', '8915', '8726', '9060', '10041', '8727', '11041', '8716', '8721', '9061', '11053', '8916', '11040', '8657', '8687', '8717', '8718', '8747', '8659', '8645', '8715', '8722', '8754', '16117', '8828', '8705', '8725', '8646', '8914', '8749', '10480', '9062', '10589', '10591', '8706', '11042', '8724', '8748', '8720', '8913', '8707', '10479', '15275', '8708', '8738', '8723', '8912', '8728', '11043', '8917', '8719', '8764'])" ]
        