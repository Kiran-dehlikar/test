
# Assignment 02

#  Problem Statements
```
Create a DockerFile.

- Use Ubuntu latest image.
- Add your name as a Manintainer.
- Update local packages using command (apt-get update).
- Install nodejs package.
- Install npm package.
- Create a symlink using command (ln -s /usr/bin/nodejs /usr/bin/node).
- Trigger a command (npm install -g http-server)
- Add any test index.html file from local at /usr/apps/hello-docker/index.html on container.
- change your working directory to /usr/apps/hello-docker/.
- Run a command (http-server -s) on every container initialization.
- Build your dockerfile and tag it with "yourname:docker-web"
- Run a docker container from the image that you have just created and map container 8080 port to host 8080 port.(8080:8080)
- Try accessing your webpage using "http://<virtualmachine_ipaddress>:8080/index.html" URL.
- Delete docker container and image from local
```
## Dockerfile 
```
FROM ubuntu:latest
LABEL maintainer="Kiran"
RUN apt-get update
RUN apt-get install -y nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g http-server
RUN mkdir -p /usr/apps/hello-docker
COPY index.html /usr/apps/hello-docker/index.html
WORKDIR /usr/apps/hello-docker/

# Run http-server on container initialization
CMD ["http-server","-s"]
```
## Create an index.html file as well to expose our website.
![Capture1](https://github.com/Kiran-dehlikar/test/assets/104997588/98437651-4acf-44f9-9b64-9605f9be39b7)
## After creation of Dockerfile, Create a image from it.
![Capture](https://github.com/Kiran-dehlikar/test/assets/104997588/f02d956a-993b-412b-93b3-90cac3cdd5ba)
## Build the dockerfile using the below commad 
``` $ docker build -t kiran:docker-web . ```

![Capture2](https://github.com/Kiran-dehlikar/test/assets/104997588/ba061d8b-3611-4de0-bb1b-4a6aeee6ba69)

![Capture3](https://github.com/Kiran-dehlikar/test/assets/104997588/7ff0dacb-96f8-4b38-92aa-486ce6426357)
## List created images
``` $ docker images ```

![Capture4](https://github.com/Kiran-dehlikar/test/assets/104997588/4e0f737a-bb8a-4716-baa7-4615cb1141b9)

## Create a container and run it from image.
``` $ docker run -it -d --name kiran-web -p 8080:8080 kiran:docker-web  ```

![Capture5](https://github.com/Kiran-dehlikar/test/assets/104997588/5cbc0437-a668-4f32-8233-2c9d13e95bb6)

## After creation go to the browser and hit the ip with port number to expose our website.

![Capture6](https://github.com/Kiran-dehlikar/test/assets/104997588/acfe61e5-6df4-4bbb-9fff-9eaac2e65fa6)

## Delete the container and images to clean the workspace

![Capture7](https://github.com/Kiran-dehlikar/test/assets/104997588/cdef836b-3ffd-4386-818c-ee9eb10ea9c2)


## Authors

- [Kiran Dehlikar](https://github.com/Kiran-dehlikar)
