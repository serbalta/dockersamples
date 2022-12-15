terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {
	host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}

resource "docker_image" "rabbitmq" {
  name         = "rabbitmq:3-management"
  keep_locally = false
}

resource "docker_container" "rabbitmq" {
  image = docker_image.rabbitmq.name
  name  = "tutorialrabbitmq"
  hostname = "myrabbit"
   ports {
    internal = 15672
    external = 8080
  }
}

resource "docker_image" "mongo" {
  name         = "mongo"
  keep_locally = false
}

resource "docker_container" "mongo" {
  image = docker_image.mongo.name
  name  = "tutorialmongo"
  ports {
	internal = 27017
    external = 27018
  }
}

resource "docker_image" "netapp" {
  name         = "netapp"
  keep_locally = false
}

resource "docker_container" "netapp" {
  image = docker_image.netapp.name
  name  = "tutorialnetapp"
  ports {
	internal = 80
    external = 8083
  }
}


