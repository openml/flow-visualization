
        FROM python:3.6

        WORKDIR /app

        # Install required dependencies
        RUN python -m venv 8
        ENV PATH="/app/8/bin:$PATH"

        RUN pip install --no-cache-dir --upgrade pip
        RUN pip install "scikit-learn==0.18.2" "numpy>=1.6.1" "scipy>=0.9" joblib threadpoolctl skl2onnx netron openml
        

        # Copy your script to the Docker image
        COPY sk_onnx.py .

        # Run your script for the model ids
        CMD [ "python", "-c", "from sk_onnx import sk_to_onnx; sk_to_onnx(['7317', '7547', '7342', '7414', '7483', '7543', '8449', '7493', '7389', '7478', '7584', '7314', '7333', '7467', '7480', '7545', '7502', '7328', '7433', '7437', '7383', '7492', '7255', '7536', '7022', '7392', '7503', '7516', '7551', '7491', '7573', '7557', '7416', '7397', '7322', '7248', '7590', '7300', '7382', '7388', '7401', '7456', '7450', '7531', '7308', '7446', '7434', '7576', '7587', '7349', '7403', '7439', '7565', '7354', '7394', '7412', '7486', '7381', '7384', '7321', '7549', '7559', '7534', '7539', '7419', '7560', '7718', '7568', '7343', '7331', '7404', '7348', '7469', '7014', '7377', '7295', '7544', '7514', '7548', '7310', '7524', '7253', '7569', '7352', '6790', '7552', '7445', '7418', '7495', '7553', '7578', '7499', '7452', '7012', '7494', '7415', '7472', '8833', '7339', '7347', '18921', '7350', '7405', '7318', '7532', '7535', '7579', '7586', '7457', '7429', '7398', '7391', '7444', '7338', '6995', '7488', '7513', '7570', '7351', '7487', '7340', '7431', '7554', '7324', '8418', '7509', '7369', '7540', '7459', '7017', '7385', '7353', '7594', '7319', '7396', '7356', '7466', '7585', '7588', '7408', '7529', '18920', '7474', '7504', '7379', '7335', '7330', '7360', '7311', '7019', '7306', '7533', '7511', '7443', '7378', '7561', '7256', '7364', '7361', '7470', '7428', '7247', '7498', '7476', '7246', '7386', '7564', '7359', '7346', '7425', '7485', '7464', '7013', '7577', '7442', '7582', '7541', '7312', '7525', '7521', '7254', '7293', '7520', '7471', '7508', '7294', '7477', '8451', '7424', '7334', '7336', '7366', '7400', '7332', '7329', '7515', '7417', '7506', '7407', '7344', '7358', '7479', '8419', '7355', '7555', '7558', '7507', '7490', '7365', '8416', '7410', '7438', '7473', '7441', '7501', '7528', '7451', '7458', '7527', '7325', '7542', '7530', '7316', '7421', '7406', '7518', '7345', '7337', '7432', '7409', '7550', '7297', '7387', '7475', '7566', '7460', '7435', '7302', '7481', '7717', '7327', '7374', '7519', '7563', '7376', '7427', '7575', '7572', '6996', '7463', '7257', '7517', '7522', '7380', '7363', '7583', '7323', '7307', '7368', '7496', '7430', '7426', '7461', '7591', '7292', '7453', '7512', '7526', '7399', '7091', '7423', '7497', '7011', '7315', '7538', '7482', '7402', '7537', '7465', '7593', '7581', '7448', '7455', '7562', '7393', '7249', '7296', '7694', '7375', '7245', '7462', '7595', '7341', '7420', '7326', '7411', '7505', '7489', '7546', '8831', '7367', '7309', '7413', '8329', '7556', '7523', '7320', '7574', '7449', '7510', '7468', '7484', '7357', '7422', '7436', '7447', '7580', '8452', '7362', '7500'])" ]
        