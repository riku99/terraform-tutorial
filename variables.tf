// defaultが渡されていない場合必須のvariableになる
variable "project" { }

variable "credentials_file" { }

variable "region" {
  // defaultを指定するとこのvariableはオプショナルになる
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}
