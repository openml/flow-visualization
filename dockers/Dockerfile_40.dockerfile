
        FROM python:3.6

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 40
        ENV PATH="/app/40/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.19.1" "numpy>=1.8.2" "scipy>=0.13.3" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['18936', '18931', '18928', '18946', '18939', '18945', '18993', '18930', '18935', '18940', '18926', '18927', '18944', '18932', '18925', '18934', '18942', '18943', '18929', '18938', '18937', '18933', '18941', '18992'])" ]
        