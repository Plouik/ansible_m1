provider "docker" {
  registry_auth {
    address = "registry-1.docker.io"
    username = "olivierdsm"
    password = "dckr_pat_IAAip57sJU2PPc5Ma-yqBG3jzG0"
  }
}

resource "docker_image" "frontend" {
  name         = "registry-1.docker.io/olivierdsm/frontend"
  build {
    context = "./frontend"
  }
  keep_locally = false
}

resource "docker_image" "backend" {
  name         = "registry-1.docker.io/olivierdsm/backend"
  build {
    context = "./backend"
    build_args = {
      ENVIRONMENT = var.ENVIRONMENT
    }
  }
  keep_locally = false
}

resource "docker_container" "frontend" {
  image = docker_image.frontend.image_id
  name  = "frontend"
  ports {
    internal = 80
    external = 80
  }
  networks_advanced {
    name = docker_network.configuration_network.name
  }
}

resource "docker_container" "backend" {
  image = docker_image.backend.image_id
  name  = "backend"
    ports {
    internal = 80
    external = 7000
  }
  networks_advanced {
    name = docker_network.configuration_network.name
  }
}

resource "docker_network" "configuration_network" {
  name = "configuration_network"
}


resource "docker_registry_image" "helloworld" {
  for_each = toset([docker_image.frontend.name, docker_image.backend.name])
  name          = each.key
  keep_remotely = false
}