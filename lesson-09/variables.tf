variable "names" {
  type = set(string)
  default = ["PocketA","PocketB","PocketC"]
}

variable "groups" {
  type = list(string)
  default = [ "SocietyA","SocietyB","SocietyC"]
}