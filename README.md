# Private Docker Registry

A project to help you build a private docker-registry image.

* [http://blog.docker.io/2013/07/how-to-use-your-own-registry/](http://blog.docker.io/2013/07/how-to-use-your-own-registry/)
* [https://github.com/dotcloud/docker-registry/tree/0.5.9](https://github.com/dotcloud/docker-registry/tree/0.5.9)

#### Get the project

```
git clone https://github.com/hopsoft/private-docker-registry.git
cd private-docker-registry
```

#### Add your Docker registry configuration to assets

An example: https://github.com/dotcloud/docker-registry/blob/0.5.9/config_sample.yml

```
vim assets/config.yml
```

#### Build the image

```
vagrant up
vagrant ssh
sudo su -
docker build -t hopsoft/docker-registry /vagrant
```

#### Run the registry

```
docker run -d -p 5000:5000 hopsoft/docker-registry /opt/private-docker-registry/start
```

#### Start Nginx to reverse proxy to the registry

```
/etc/init.d/nginx start
```

You can see the nginx config [here](https://github.com/hopsoft/private-docker-registry/blob/master/provision).

#### Create an image

```
docker run -i -t ubuntu bash
apt-get install hello
exit
```

#### Tag the image into the private registry

```
docker ps -a | grep ubuntu
docker commit 327db2da537e localhost:80/hello
```

#### Push the image to the private registry

```
docker push localhost:80/hello
```

#### Interact with the private registry via the API

```
curl http://localhost/v1/repositories/hello/images
curl http://localhost/v1/images/8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c/json
curl http://localhost/v1/repositories/hello/tags
curl -X DELETE http://localhost/v1/repositories/hello
```

Read more about the API [here](http://docs.docker.io/en/latest/api/registry_index_spec/).

_Note: Delete repository doesn't seem to work._

