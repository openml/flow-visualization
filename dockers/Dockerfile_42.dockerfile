
        FROM python:3.7

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 42
        ENV PATH="/app/42/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.20.0" "numpy>=1.8.2" "scipy>=0.13.3" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['18961', '18953', '18958', '18963', '18983', '18954', '18980', '18967', '18968', '18970', '18972', '18978', '18969', '18956', '18975', '18966', '18981', '18960', '18979', '18957', '18964', '18959', '18971', '18952', '18962', '18965', '18951', '18976', '18955', '18973', '18974', '18977', '18982'])" ]
        