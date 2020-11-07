client_id       = "14f50336-6a0a-4372-96c2-670b9797ef08"
client_secret   = "Xj6L_FY3~m~8-p2a1KLT_BPGgLQ5~Q0y1J"
tenant_id       = "87bc3a6e-ce51-4b80-9065-3ab9d29720be"
subscription_id = "e41389ab-0543-4233-99f1-d56a018bdc1b"
object_id       = "6138e3c7-3e10-49a8-85a9-b2c32696d55f"

resource_group_name  = "test_aks-rg"
location             = "westeurope"
vnet_name            = "aks_vnet"
aks_subnet_name      = "aks_subnet"
log_analyticsws_name = "vjtest-aks-loganalytics-ws"

linux_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDdBKXgj7Rs696JPzYNvfA4WfFnfAM67HzE7e20qAer8R4rXstiXMZ3dGcb/FN8rw1rUYq97Y9nktrxGsK6OAPoZT3y3HeY+eFsgM1hje2U1Es0ua4c0B8snzW7M9YDWF2jdDg7paIkdYHWgXG+toVBIozhkXV7VPIfZaFKv2NG4lOZq8bEiXksnsAb7Gf+f6To4Vosu5bFZ7GZmhOolzoXh9puQSVP0RHItN99pTfPSmuT1yA+8vcupnDL7oY42WYAFq/7CgZ/qUWhLRTExJ0E4HBO3I8C/njP8eLQcLMzoyd7jT/+f8MqQiMfwc9BqzmSMkfecv1vZFAkaGv8KBNbekkWHLz6aMr2yalYVT0mLenzNu0s0Fu/CJfQUGyk1PQZ9H2eAdudg/STRMHXB0PN6mYAACEE2NWBVQ3W5NHtwG77n4w7fkPMl5bemOtflELW0ndv8xBW67L8THBSKOeqwz/9qQoH6JO7xdhHt0+eo1vA4ypqYHAmQuoobaVX8N03FEy/ANd5Ws/TH+ugTHddEWqpoMNQ28V0717mF/EeZIGUpx89Rl3RPXMwU/iKvgNpq+09ebT2OKyBM/D6yXjhar8d7lpP3zk9ecKe+GCY6DkFqvqSDCvRL4eCQMOUa3lCrmZmi7yJm/Dmh3DfAZnmMDNYBosVRmb2VDwxkw8dPw== vijay.narayansamy@gmail.com"


aks_name           = "aks"
dns_prefix         = "vjtest"
kubernetes_version = "1.17.13"

node_pool_count           = 2
node_pool_vm_size         = "Standard_D2_v2"
node_pool_max_pods        = 50
node_pool_os_disk_size_gb = 30

auto_scaling_min_count = 2
auto_scaling_max_count = 100

network_docker_bridge_cidr = "172.17.0.1/16"
aks_service_cidr           = "10.2.0.0/16"
dns_service_ip             = "10.2.0.10"

#rbac_aad_admin = ["66b25d1e-7834-4a1b-bb00-c572d2eb29b6"]

