# R: harbor(v1.8.2)

```bash

[root@dev-ecs-cluster-entry harbor]# sh install.sh

[Step 0]: checking installation environment ...

Note: docker version: 19.03.1

Note: docker-compose version: 1.24.1

[Step 1]: loading Harbor images ...
aa686b5974df: Loading layer [==================================================>]  33.54MB/33.54MB
c5a875ae4572: Loading layer [==================================================>]   2.56kB/2.56kB
f41d90ead0d8: Loading layer [==================================================>]  1.536kB/1.536kB
7c34ab1ea4d8: Loading layer [==================================================>]  70.38MB/70.38MB
249f63b045e5: Loading layer [==================================================>]  42.56MB/42.56MB
921406675b84: Loading layer [==================================================>]  144.4kB/144.4kB
6073309d6da9: Loading layer [==================================================>]  3.006MB/3.006MB
Loaded image: goharbor/prepare:v1.8.2
46616369053c: Loading layer [==================================================>]  8.972MB/8.972MB
1b828653cd5b: Loading layer [==================================================>]  3.072kB/3.072kB
33b188f34874: Loading layer [==================================================>]   2.56kB/2.56kB
14a174b06056: Loading layer [==================================================>]   20.1MB/20.1MB
8b93b32369ea: Loading layer [==================================================>]   20.1MB/20.1MB
Loaded image: goharbor/registry-photon:v2.7.1-patch-2819-v1.8.2
ea7891a0bdb7: Loading layer [==================================================>]  8.971MB/8.971MB
9f1f7fc98f26: Loading layer [==================================================>]  5.143MB/5.143MB
137c5a4ac20a: Loading layer [==================================================>]  13.72MB/13.72MB
b6360a726273: Loading layer [==================================================>]  26.47MB/26.47MB
585e80b4f36f: Loading layer [==================================================>]  22.02kB/22.02kB
1f3dc4c04b4f: Loading layer [==================================================>]  3.072kB/3.072kB
05c7e4b9e229: Loading layer [==================================================>]  45.33MB/45.33MB
Loaded image: goharbor/notary-signer-photon:v0.6.1-v1.8.2
43aa82261a85: Loading layer [==================================================>]  8.976MB/8.976MB
af038c20e7c1: Loading layer [==================================================>]  44.39MB/44.39MB
eed7220df898: Loading layer [==================================================>]  2.048kB/2.048kB
0e8b72c39bee: Loading layer [==================================================>]  3.072kB/3.072kB
9c3113c64d1b: Loading layer [==================================================>]   44.4MB/44.4MB
Loaded image: goharbor/chartmuseum-photon:v0.9.0-v1.8.2
e80f0576d310: Loading layer [==================================================>]  50.61MB/50.61MB
186db8ba55d1: Loading layer [==================================================>]  3.584kB/3.584kB
a59603f5ed0c: Loading layer [==================================================>]  3.072kB/3.072kB
53398a2dca90: Loading layer [==================================================>]   2.56kB/2.56kB
846dfe33e97c: Loading layer [==================================================>]  3.072kB/3.072kB
c126a8f0382a: Loading layer [==================================================>]  3.584kB/3.584kB
7d5193da02ce: Loading layer [==================================================>]  12.29kB/12.29kB
Loaded image: goharbor/harbor-log:v1.8.2
71f77bcedea9: Loading layer [==================================================>]  8.971MB/8.971MB
a4f8ded04084: Loading layer [==================================================>]  38.82MB/38.82MB
2c6987b39df6: Loading layer [==================================================>]  38.82MB/38.82MB
Loaded image: goharbor/harbor-jobservice:v1.8.2
753f7c6f8b25: Loading layer [==================================================>]  75.25MB/75.25MB
b875b17bf8a4: Loading layer [==================================================>]  3.072kB/3.072kB
86ecd3b81cfb: Loading layer [==================================================>]   59.9kB/59.9kB
a9fbb31bafa7: Loading layer [==================================================>]  61.95kB/61.95kB
Loaded image: goharbor/redis-photon:v1.8.2
a3237831cfcb: Loading layer [==================================================>]    113MB/113MB
386c5a8e9c88: Loading layer [==================================================>]  10.94MB/10.94MB
8829d23fb43d: Loading layer [==================================================>]  2.048kB/2.048kB
bc888c257f91: Loading layer [==================================================>]  48.13kB/48.13kB
fa9164713bc4: Loading layer [==================================================>]  3.072kB/3.072kB
31aa317d7c49: Loading layer [==================================================>]  10.99MB/10.99MB
Loaded image: goharbor/clair-photon:v2.0.8-v1.8.2
7cdf420c6b3b: Loading layer [==================================================>]  3.552MB/3.552MB
7681503cd0ce: Loading layer [==================================================>]   6.59MB/6.59MB
6017b1349b88: Loading layer [==================================================>]  161.3kB/161.3kB
a6b64e22b163: Loading layer [==================================================>]    215kB/215kB
b331c3e3802c: Loading layer [==================================================>]  3.584kB/3.584kB
Loaded image: goharbor/harbor-portal:v1.8.2
161334fdd970: Loading layer [==================================================>]  8.971MB/8.971MB
f8d0f54764f5: Loading layer [==================================================>]  46.86MB/46.86MB
83be89123a82: Loading layer [==================================================>]  5.632kB/5.632kB
068f0cef76ae: Loading layer [==================================================>]  29.18kB/29.18kB
491c1ff215fe: Loading layer [==================================================>]  46.86MB/46.86MB
Loaded image: goharbor/harbor-core:v1.8.2
5e4de1d8e753: Loading layer [==================================================>]  3.552MB/3.552MB
Loaded image: goharbor/nginx-photon:v1.8.2
e1e971b2f0c0: Loading layer [==================================================>]  15.13MB/15.13MB
91c7d11c3563: Loading layer [==================================================>]  26.47MB/26.47MB
1451914dc386: Loading layer [==================================================>]  22.02kB/22.02kB
b323a48f40b5: Loading layer [==================================================>]  3.072kB/3.072kB
78f4a7665fe7: Loading layer [==================================================>]  46.74MB/46.74MB
Loaded image: goharbor/notary-server-photon:v0.6.1-v1.8.2
f1012ea67437: Loading layer [==================================================>]  63.49MB/63.49MB
16483d7f88d6: Loading layer [==================================================>]  51.45MB/51.45MB
5e0e30bee957: Loading layer [==================================================>]  6.656kB/6.656kB
0c9bed58000b: Loading layer [==================================================>]  2.048kB/2.048kB
8c4640fa2094: Loading layer [==================================================>]   7.68kB/7.68kB
52da0e4efee0: Loading layer [==================================================>]   2.56kB/2.56kB
02aecfbf8fd2: Loading layer [==================================================>]   2.56kB/2.56kB
84f01eef4159: Loading layer [==================================================>]   2.56kB/2.56kB
Loaded image: goharbor/harbor-db:v1.8.2
cd50388a0f95: Loading layer [==================================================>]  8.972MB/8.972MB
b773af184e06: Loading layer [==================================================>]  3.072kB/3.072kB
fbdb4bfafa52: Loading layer [==================================================>]   20.1MB/20.1MB
792ef1323806: Loading layer [==================================================>]  3.072kB/3.072kB
206421098579: Loading layer [==================================================>]  7.465MB/7.465MB
44e21983c5ca: Loading layer [==================================================>]  27.56MB/27.56MB
Loaded image: goharbor/harbor-registryctl:v1.8.2
234d2630ea52: Loading layer [==================================================>]    338MB/338MB
9115aae34ec7: Loading layer [==================================================>]    107kB/107kB
Loaded image: goharbor/harbor-migrator:v1.8.2


[Step 2]: preparing environment ...
prepare base dir is set to /opt/skharbor/harbor
Generated configuration file: /config/log/logrotate.conf
Generated configuration file: /config/nginx/nginx.conf
Generated configuration file: /config/core/env
Generated configuration file: /config/core/app.conf
Generated configuration file: /config/registry/config.yml
Generated configuration file: /config/registryctl/env
Generated configuration file: /config/db/env
Generated configuration file: /config/jobservice/env
Generated configuration file: /config/jobservice/config.yml
Generated and saved secret to file: /secret/keys/secretkey
Generated certificate, key file: /secret/core/private_key.pem, cert file: /secret/registry/root.crt
Generated configuration file: /compose_location/docker-compose.yml
Clean up the input dir



[Step 3]: starting Harbor ...
Creating network "harbor_harbor" with the default driver
Creating harbor-log ... done
Creating redis       ... done
Creating registry    ... done
Creating harbor-db   ... done
Creating registryctl ... done
Creating harbor-core ... done
Creating harbor-portal     ... done
Creating harbor-jobservice ... done
Creating nginx             ... done

✔ ----Harbor has been installed and started successfully.----

Now you should be able to visit the admin portal at http://harbor.shaneking.org.
For more details, please visit https://github.com/goharbor/harbor .

```
