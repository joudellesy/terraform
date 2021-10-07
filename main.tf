provider "aws" {
    access_key  = var.access_key
    secret_key  = var.secret_key
    region      = var.region
}

resource "aws_instance" "ec2_example" {

   ami           = var.ami
   instance_type =  var.instance_type

   tags = {
           Name = var.environment_name
   }
} 

# resource "aws_iam_user" "example_count" {
#   name  = "sample_user_JoudelleSy"

#    groups = [
#     aws_iam_group.group1.name,
#   ]
# }

#count
resource "aws_iam_user" "example_count" {
  count = length(var.user_names_forandforloop)
  name  = var.user_names_forandforloop[count.index]
}

#foreach
resource "aws_iam_user" "example_foreach" {
  for_each = var.user_names_foreach
  name  = each.value
}


#for loop
output "print_the_names_forloop" {
  value = [for name in var.user_names_forandforloop : name]
}


#using Map
output "user_with_roles_usingmap" {
  value = [for name, role in var.iam_users_map : "${name} is the ${role}"]
}
