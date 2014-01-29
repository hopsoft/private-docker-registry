# Your Own Private Docker Registry

## Use the Trusted Image

**Important:** When using S3,
be sure to set the `boto_bucket` config value to your S3 bucket name;
otherwise, the Django application won't start.

```
sudo docker run -i -t -p 5000:5000 hopsoft/docker-registry bash

# update the config
vim /opt/docker-registry/config/config.yml

# run the registry
/opt/hopsoft/docker-registry/start &

# detach
<CTL-P><CTL-Q>
```

## Use the Registry

### Create an Image

```
docker pull ubuntu
docker tag ubuntu localhost:5000/ubuntu
docker push localhost:5000/ubuntu
```

### Interact with the private registry via the API

```
curl http://localhost:5000/v1/repositories/ubuntu/images
curl http://localhost:5000/v1/images/8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c/json
curl http://localhost:5000/v1/repositories/ubuntu/tags
curl -X DELETE http://localhost:5000/v1/repositories/ubuntu
```

Read more about the API [here](http://docs.docker.io/en/latest/api/registry_index_spec/).

## Build the Image Manually

#### Dependencies

* [Virtual Box](https://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/)

```
git clone git@github.com:hopsoft/private-docker-registry.git
cd private-docker-registry
vagrant up
vagrant ssh
sudo docker build -t hopsoft/docker-registry /vagrant
```

