import json
import yandexcloud
from pathlib import Path

from yandex.cloud.resourcemanager.v1.cloud_service_pb2_grpc import (
    CloudServiceStub,
)
from yandex.cloud.resourcemanager.v1.cloud_service_pb2 import (
    ListCloudsRequest,
    ListCloudsResponse,
    # ListCloudsMetadata
)

def read_service_account(filename: str) -> str:
    path = Path(filename)
    with path.open() as f:
        return json.load(f)


sa_key = read_service_account("ansible/key.json")
sdk = yandexcloud.SDK(service_account_key=sa_key)

cloud_service = sdk.client(CloudServiceStub)

operation = cloud_service.List(ListCloudsRequest())
print("CloudList:")
print(operation.__dir__())
# print(operation.clouds)

# ##
# from yandex.cloud.compute.v1.instance_service_pb2_grpc import InstanceServiceStub
# from yandex.cloud.compute.v1.instance_service_pb2 import DeleteInstanceRequest

# def delete_instance(sdk, instance_id):
#     instance_service = sdk.client(InstanceServiceStub)
#     return instance_service.Delete(
#         DeleteInstanceRequest(instance_id=instance_id))
# operation = delete_instance(sdk, "12321")
# print("Instandedelete:")
# print(operation.__dir__())
# print()
# ##

# res = sdk.wait_operation_and_get_result(
#     operation,
#     # response_type=ListCloudsResponse,
#     meta_type=None
# )
# print(res)
