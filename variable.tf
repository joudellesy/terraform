variable "access_key" {}
variable "secret_key" {}
variable "region" {}
variable "ami" {}
variable "instance_type" {
   #this is commented because you have already terraform.tfvars included the instance type
   # description = "Instance type t2.micro"
   # type        = string
   # default     = "t2.micro"
}
variable "environment_name" {
}

#for "count" in main.tf / and also in "for loop"
variable "user_names_forandforloop" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}

#foreach in main.tf
variable "user_names_foreach" {
  description = "IAM usernames"
  type        = set(string)
  default     = ["user4", "user5", "user6"]
} 

#"count" using MAP syntax
variable "iam_users_map" {
  description = "map"
  type        = map(string)
  default     = {
    user1      = "normal user"
    user2  = "admin user"
    user3 = "root user"
  }
}