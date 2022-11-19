## Lab 11
Output of the commands inside:
`kubectl get secrets`
```
NAME           TYPE     DATA   AGE
db-user-pass   Opaque   2      118s
```
`kubectl describe secret db-user-pass`
```
Name:         db-user-pass
Namespace:    default
Labels:       <none>
Annotations:  <none>

Type:  Opaque

Data
====
password:  12 bytes
username:  7 bytes
```

## Helm
Installation:
`helm plugin install https://github.com/jkroepke/helm-secrets`
install `sops` and `gpg2`
Keypair:
`gpg2 --gen-key`
add `env` to `deployment.yaml`
```
env:
            - name: TIME_USER
              valueFrom:
                secretKeyRef:
                  name: time-secret
                  key: user
            - name: TIME_PASS
              valueFrom:
                secretKeyRef:
                  name: time-secret
                  key: pass
```
use sops on secret-data.yaml `sops --encrypt --pgp B811EA344EE63559A5D11AC7917BD4D5AB3FB001 --in-place secret-data.yaml`
`secret-data.yaml` now:
```
data:
    - ENC[AES256_GCM,data:muiTNg==,iv:9WXrfLFrAb/bHK49ZrN2CkWCl2QWTtt0FI+9Ee$
    - ENC[AES256_GCM,data:+jKg5zo=,iv:owrXIbV9ff1H1DC03NswvXG7VbA5dOFV8Kdibs$
    - ENC[AES256_GCM,data:wB1lAG0rigM=,iv:SkDRpAFBsibtt0ROCo4gLyw34BH3zE0YUI$
sops:
    kms: []
    gcp_kms: []
    azure_kv: []
    hc_vault: []
    age: []
    lastmodified: "2022-11-19T18:16:06Z"
    mac: ENC[AES256_GCM,data:CXUwxcmYojU9JttealM/BrXZFScf18nNjAQ3WJR99p22h0z$
    pgp:
        - created_at: "2022-11-19T18:16:05Z"
          enc: |
            -----BEGIN PGP MESSAGE-----

            hF4DzDj+GRpyMBwSAQdAuaCPCUfTPhCJ8ZtT+dKFL7o8rel5Jw9Kth6eu/HWJUww
            3JYdxa8FlnXpcZOFCJrZ6axFmThrj7OScy7c2xO6W12owgpBJpLYUKMbJ3y9Z93a
            1GYBCQIQ83JBWZyPwu/iUfFko9kEAveGn6ztrM/JHj91MoLzcagKf5j4agl6Okwc
            ruxGzg4cDodKq8AGmmLU6QCnqEAu6DcitM73anmRgoVoeikIha4hr/Kyn/zhv7tw
            zLp2hf4OdbA=
            =nIoJ
            -----END PGP MESSAGE-----
          fp: B811EA344EE63559A5D11AC7917BD4D5AB3FB001
    unencrypted_suffix: _unencrypted
    version: 3.7.3
```
` kubectl get pods`
```
NAME                              READY   STATUS              RESTARTS   AGE
devops-time-app-c955c4545-tjsrr   0/1     ContainerCreating   0          9s
```
`kubectl exec devops-time-app-c955c4545-tjsrr  -- printenv`
```
HOSTNAME=devops-time-app-c955c4545-tjsrr
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_PORT=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_SERVICE_HOST=10.96.0.1
KUBERNETES_SERVICE_PORT=443
LANG=C.UTF-8
GPG_KEY=A035C8C19219BA821ECEA86B64E628F8D684696D
PYTHON_VERSION=3.10.8
PYTHON_PIP_VERSION=22.2.2
PYTHON_SETUPTOOLS_VERSION=63.2.0
PYTHON_GET_PIP_URL=https://github.com/pypa/get-pip/raw/5eaac1050023df1f5c98b173b248c260023f2278/public/get-pip.py
PYTHON_GET_PIP_SHA256=5aefe6ade911d997af080b315ebcb7f882212d070465df544e1175ac2be519b4
HOME=/root

```