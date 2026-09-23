variable "puerto_web" {
  description = "Puerto externo del frontend por entorno"
  type        = map(number)
}

variable "puerto_api" {
  description = "Puerto externo del backend por entorno"
  type        = map(number)
}

variable "puerto_bd" {
  description = "Puerto externo de la base de datos por entorno"
  type        = map(number)
}