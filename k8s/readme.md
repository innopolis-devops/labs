# k8s

    /home/ease_/u/labs/k8s    lab11 !4 ?2  kubectl create secret generic easel-secret \
    --from-literal=username='ease_l' \
    --from-literal=password='ease_l'
secret/easel-secret created
    /home/ease_/u/labs/k8s    lab11 !4 ?2  kubectl describe secret easel-secret             ✔  minikube ⎈
Name:         easel-secret
Namespace:    default
Labels:       <none>
Annotations:  <none>

Type:  Opaque

Data
====
username:  6 bytes
password:  6 bytes
    /home/ease_/u/labs/k8s    lab11 !4 ?2   kubectl get secret easel-secret                 ✔  minikube ⎈
NAME           TYPE     DATA   AGE
easel-secret   Opaque   2      46s
    /home/ease_/u/labs/k8s    lab11 !4 ?2  kubectl get secret easel-secret -o jsonpath='{.data}'
{"password":"ZWFzZV9s","username":"ZWFzZV9s"}%                                                                          /home/ease_/u/labs/k8s    lab11 !4 ?2  kubectl get secret easel-secret --template={{.data.username}} | base64 -d
ease_l%                                                                                                                 /home/ease_/u/labs/k8s    lab11 !4 ?2  helm plugin install https://github.com/jkroepke/helm-secrets --version v4.2.0
Installed plugin: secrets
    /home/ease_/u/labs/k8s    lab11 !4 ?2  gpg --gen-key                                         ✔  12s 
gpg (GnuPG) 2.2.36; Copyright (C) 2022 g10 Code GmbH
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

gpg: directory '/home/easel/.gnupg' created
gpg: keybox '/home/easel/.gnupg/pubring.kbx' created
Note: Use "gpg --full-generate-key" for a full featured key generation dialog.

GnuPG needs to construct a user ID to identify your key.

Real name: easel
Email address: arina031120000@gmail.com
You selected this USER-ID:
    "easel <arina031120000@gmail.com>"

Change (N)ame, (E)mail, or (O)kay/(Q)uit? o
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
gpg: /home/easel/.gnupg/trustdb.gpg: trustdb created
gpg: directory '/home/easel/.gnupg/openpgp-revocs.d' created
gpg: revocation certificate stored as '/home/easel/.gnupg/openpgp-revocs.d/9328CB4E8DD414481156EB07B07F3B85527721A2.rev'
public and secret key created and signed.

pub   rsa3072 2022-11-15 [SC] [expires: 2024-11-14]
      9328CB4E8DD414481156EB07B07F3B85527721A2
uid                      easel <arina031120000@gmail.com>
sub   rsa3072 2022-11-15 [E] [expires: 2024-11-14]

    /home/ease_/u/labs/k8s    lab11 !4 ?4  sops -p 9328CB4E8DD414481156EB07B07F3B85527721A2 secrets.yaml
[PGP]    WARN[0000] Deprecation Warning: GPG key fetching from a keyserver within sops will be removed in a future version of sops. See https://github.com/mozilla/sops/issues/727 for more information.
    /home/ease_/u/labs/k8s    lab11 !4 ?4  ls                                                 ✔  1m 38s 
app-python      photo_2022-11-08_05-46-16.jpg  Screenshot_20221108_053620.png  secrets.yaml
deployment.yml  readme.md                      scrren2.png                     service.yml

    /home/ease_/u/labs/k8s    lab11 !4 ?4  kubectl get pods                               1 ✘  minikube ⎈
NAME                                    READY   STATUS    RESTARTS   AGE
app-python-deployment-9496bf59d-4fcv5   1/1     Running   0          111m


   /home/ease_/u/labs/k8s    lab11 !4 ?4  kubectl exec app-python-deployment-9496bf59d-4fcv5 -- printenv | grep MY_PASSWORD
MY_PASSWORD=ease_l

