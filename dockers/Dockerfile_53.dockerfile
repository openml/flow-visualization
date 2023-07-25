
        FROM python:3.8

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 53
        ENV PATH="/app/53/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==1.1.2" "numpy>=1.17.3" "scipy>=1.3.2" "joblib>=1.0.0" "threadpoolctl>=2.0.0" skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['19448', '19184', '19189', '19449', '19329', '19446', '19445', '19150', '19186', '19188', '19183', '19187', '19147', '19145', '19152', '19444', '19193', '19447', '19146', '19185', '19192'])" ]
        