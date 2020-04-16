# s2i-superset
Apache Superset on openshift 3.11


# Deployment the applicacion in Openshift


### 1) Prepare the enviroment for Openshift

```sh
$ oc login https://openshift.example.com:443 --token={xxxxxxxxxx}
$ oc new-project project-dev --description="Project - Dev" --display-name="Project Dev"
$ oc status

```

### 2) Add image to openshift registry

```sh
$ mkdir -p /home/usuario/superset
$ cd /home/usuario/superset
$ git clone https://github.com/ernestosequeira/s2i-superset.git
$ cd /home/usuario/superset/image-to-registry
$ oc start-build superset --from-dir . --follow
```


# 3) Deployment the application 


### Run command

```sh
$ oc create -f template.yaml
```


# To build Build


### To build this image locally with s2i:

```sh
$ git clone https://github.com/ernestosequeira/s2i-superset.git
$ docker build -t esequeira/openshift-superset:2 .
$ s2i build superset/ esequeira/openshift-superset:2 esequeira/s2i-superset:2
```

