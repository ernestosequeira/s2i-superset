# s2i-superset
Apache Superset 0.28.1 on openshift

### Build/Installation
To build this image locally with s2i:
```sh
$ docker pull irfius/s2i-py368-centos7:1
$ s2i build https://github.com/irfius/s2i-superset --context-dir=superset irfius/s2i-py368-centos7:1 superset:0.28.1
```