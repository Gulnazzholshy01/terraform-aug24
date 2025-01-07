# resource "aws_iam_user" "users" {
#   for_each = var.user_map
#   name = each.value
# }


# variable "user_list" {
#   type = set(string)
#   default = ["anna", "john", "bob", "lisa"]

#   //each.key OR each.value; each.key=each.value
# }


# variable "user_map" {
#   type = map(string)
#   default = {
#     "user1" = "anna"
#     "user2" = "john"   
#     "user3" = "bob"
#     "user4" = "lisa"
#    //each.key OR each.value
#   }
# }
/*

1. create var list
2. for_each var.list
3. each.key / each.value


variable "list" {
  type = list
  default = ["anna", "john", "bob", "lisa"]
}

resource "test" {
  for_each = var.set or var.map
  name     = each.key / each.value
}




list = ["student1", "student2", "student3"]
map = { "studen1" = "anna"; "student2" = "bob" , "student3" = "lisa"}
object = (student1 =  {
                name = anna;
                grade= A
                phone = 1234567 
                }
          student2 =  {
                name = bob;
                grade= B
                phone = 345567 
                })
*/