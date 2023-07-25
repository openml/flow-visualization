from sklearn.model_selection import train_test_split
from skl2onnx import convert_sklearn
from skl2onnx.common.data_types import FloatTensorType, StringTensorType
import numpy as np
import netron
import os
from openml import flows, runs

def sk_to_onnx(flow_ids, save_dir = "onnx_models"):
    for flow_id in flow_ids:
        flow_id=int(flow_id)
        print(f'Converting flow {flow_id}')

        flow = flows.get_flow(flow_id, reinstantiate=True)
        model = flow.model
        print("Model converted: ", model)
        
        X = [[1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]]
        y = [0, 1, 2]

        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
        model.fit(X_train, y_train)

        initial_type = [('dummy_input', FloatTensorType([3, 3]))]
        model_onnx = convert_sklearn(model, initial_types=initial_type)
        # print(model_onnx)

        # onnx.save_model(model, "test.onnx")
        location = os.path.join(save_dir, f"flow_{flow_id}.onnx")
        print(location)
        with open(location, "wb") as f:
            f.write(model_onnx.SerializeToString())
        
        print("Model converted to onnx!")
    
    print("All done!")

def visualize_onnx(flow_id, directory):
    filename = os.path.join(directory, f"flow_{flow_id}.onnx")
    if not os.path.exists(filename):
        raise FileNotFoundError(f"The file '{filename}' does not exist. Make sure you have already converted this flow to onnx format.")
    
    netron.start(filename)

# sk_to_onnx([19433], "onnx_models")
# visualize_onnx(19433, "onnx_models")