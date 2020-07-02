# swagger-ui_custom_api
swagger-ui container with custom API definition 

## Deployment 

copy custom api yaml (or json) file `swagger_name.yaml` with swager to `/api` directory

build docker image using:

```docker build -t swagger-ui_custom_api . ```

and run the container:

```docker run -d -p 80:8080 swagger-ui_custom_api```

> -d  detached mode: run containers in the background

> -p 80:8080 port mapping 80 on host's machine to container's 8080 (if required change port number from 80 to selected one) 

if name of api yaml file is different than `swagger.yaml` (default) the `SWAGGER_YAML` env variable should be set while the contaner is started, like below:

```docker run -d -p 80:8080 -e SWAGGER_YAML=swagger_name.yaml swagger-ui_custom_api```

> thanks to that variable, when you access swagger via browser the selected file will be loaded as default. The file can be changed using `Explore` pool in website IF the file is located in `app` directory 

if api yaml files weren't availbe in `app` directory while the docker image was building, docker volumes can be used to synchronize `api` directory between host and docker container, like below:

```docker run -p 80:8080 -e SWAGGER_YAML=swagger.yaml -v api:/usr/share/nginx/html/api swagger-ui_custom_api```

**Note:**
succesfully tested with `swaggerapi/swagger-ui:v3.28.0`

**Remember:**
to tests some aplication's api via deployed swagger, the aplication needs to supports CORS operation. If not, use [CORS Unblock](https://addons.mozilla.org/pl/firefox/addon/cors-unblock/?src=search) add-on in mozilla firefox browser. 
