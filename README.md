# s2i-superset
Apache Superset on openshift 3.11


# 1. Deployment the applicacion in Openshift


### Prepare the enviroment for Openshift

```sh
$ oc login https://openshift.example.com:443 --token={xxxxxxxxxx}
$ oc new-project project-dev --description="Project - Dev" --display-name="Project Dev"
$ oc status

```

### Add image to openshift registry

```
mkdir -p /home/usuario/superset
cd /home/usuario/superset
git clone https://github.com/ernestosequeira/s2i-superset.git
cd /home/usuario/superset/image-to-registry
oc new-build --name superset --binary --strategy docker
oc start-build superset --from-dir . --follow -n project-dev
```


# 2. Deployment the application 


### Run command

```sh
$ oc create -f template.yaml
```


# 3. To build Build


### To build this image locally with s2i:

```sh
$ git clone https://github.com/ernestosequeira/s2i-superset.git
$ docker build -t esequeira/openshift-superset:2 .
$ s2i build superset/ esequeira/openshift-superset:2 esequeira/s2i-superset:2
```

