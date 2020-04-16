# s2i-superset
Apache Superset on openshift 3.11

### To build Build


# To build this image locally with s2i:

```sh
$ git pull https://github.com/ernestosequeira/s2i-superset.git
$ docker build -t esequeira/openshift-superset:2 .
$ s2i build superset/ esequeira/openshift-superset:2 esequeira/s2i-superset:2
```

### Running the application with openshift 

# Create Dockerfile

```sh
$ mkdir -p /home/usuario/superset
$ cd /home/usuario/superset
$ touch Dockerfile
	FROM esequeira/supernet:2
```

```
$ oc login https://openshift.example.com:443 --token={xxxxxxxxxx}
$ oc new-project project-dev --description="Project - Dev" --display-name="Project Dev"
$ oc status
$ oc start-build superset --from-dir . --follow

```
