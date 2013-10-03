# Private Docker Registry

A project to help you build a private docker-registry image.

* [http://blog.docker.io/2013/07/how-to-use-your-own-registry/](http://blog.docker.io/2013/07/how-to-use-your-own-registry/)
* [https://github.com/dotcloud/docker-registry/tree/0.5.9](https://github.com/dotcloud/docker-registry/tree/0.5.9)

#### Get the project

```
git clone https://github.com/hopsoft/private-docker-registry.git
cd private-docker-registry
```

#### Add your configuration

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

#### Start Nginx to reverse proxy to the regreistry

```
/etc/init.d/nginx start
```

_Have a look at `/etc/nginx/conf.d/docker.conf` to check out the config._

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

