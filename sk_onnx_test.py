from sklearn.model_selection import train_test_split
from skl2onnx import convert_sklearn
from skl2onnx.common.data_types import FloatTensorType, StringTensorType
import numpy as np
import netron
import os
from openml import flows, runs

def sk_to_onnx(flow_id, save_dir = "onnx_models"):
    
    flow_id=int(flow_id)
    flow = flows.get_flow(flow_id, reinstantiate=True)
    model = flow.model
    
    X = [[1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]]
    y = [0, 1, 2]

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    model.fit(X_train, y_train)

    initial_type = [('dummy_input', FloatTensorType([3, 3]))]
    model_onnx = convert_sklearn(model, initial_types=initial_type)    
    location = os.path.join(save_dir, f"flow_{flow_id}.onnx")
    
    with open(location, "wb") as f:
        f.write(model_onnx.SerializeToString())

    netron.start(location) 

sk_to_onnx(19433, "onnx_models")
