resource "docker_image" "nginx" {
  name = "nginx:1.30.5"
}

resource "docker_image" "node" {
  name = "node:18-alpine"
}

resource "docker_image" "postgres" {
  name = "postgres:15-alpine"
}

resource "docker_network" "red" {
  name = "red-${terraform.workspace}"
}

resource "docker_container" "web" {
  name  = "web-${terraform.workspace}"
  image = docker_image.nginx.image_id

  networks_advanced {
    name = docker_network.red.name
  }

  ports {
    internal = 80
    external = var.puerto_web[terraform.workspace]
  }
}


resource "docker_container" "api" {
  name    = "api-${terraform.workspace}"
  image   = docker_image.node.image_id
  command = ["tail", "-f", "/dev/null"]

  networks_advanced {
    name = docker_network.red.name
  }

  ports {
    internal = 3000
    external = var.puerto_api[terraform.workspace]
  }
}


resource "docker_container" "bd" {
  name  = "bd-${terraform.workspace}"
  image = docker_image.postgres.image_id

  env = [
    "POSTGRES_USER=${terraform.workspace}_user",
    "POSTGRES_PASSWORD=${terraform.workspace}_pass",
    "POSTGRES_DB=${terraform.workspace}_db"
  ]

  networks_advanced {
    name = docker_network.red.name
  }

  ports {
    internal = 5432
    external = var.puerto_bd[terraform.workspace]
  }
}