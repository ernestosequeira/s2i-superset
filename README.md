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
oc start-build superset --from-dir . --follow
```


# 2. Deployment the application 


### Run command

```sh
cd /home/usuario/superset/
$ oc new-app -f template.yml
```


# 3. To build Build


### To build this image locally with s2i:

```sh
$ git clone https://github.com/ernestosequeira/s2i-superset.git
$ docker build -t esequeira/superset:5 .
$ s2i build superset/ esequeira/superset:5 esequeira/superset:5
$ docker login
$ docker push esequeira/superset:5
```

