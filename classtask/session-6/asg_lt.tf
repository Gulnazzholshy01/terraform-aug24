# resource "aws_launch_template" "apache-lt" {
#   name = "apache-launch-template"
#   image_id = "ami-01816d07b1128cd2d"
#   instance_type = "t2.micro"


#   block_device_mappings {
#     device_name = "/dev/sdf"

#     ebs {
#       volume_size = 8
#     }
#   }

#   monitoring {
#     enabled = true
#   }

# user_data =  filebase64("${path.module}/extras/userdata.sh")
# }


# variable "tags" {
#     type = list(object({
#         key = string
#         value = string
#         propagate_at_launch = bool
#     }))
#     default = [ {
#       key = "Name"
#       value = "ASG"
#       propagate_at_launch = true
#     },
#     {
#       key = "team"
#       value = "devops"
#       propagate_at_launch = true      
#     }
#      ]
# }




# resource "aws_autoscaling_group" "app-asg" {
#   name                      = "asg-session5"
#   max_size                  = 4
#   min_size                  = 2
#   health_check_grace_period = 300
#   health_check_type         = "ELB"
#   desired_capacity          = 3
#   vpc_zone_identifier  =  [for subnet in data.aws_subnet.selected : subnet.id]

#   launch_template {
#     id      = aws_launch_template.apache-lt.id
#     version = "$Latest"
#   }

#   dynamic "tag" {
#     for_each = var.tags 
#    content {
#     key = tag.value.key
#     value = tag.value.value
#     propagate_at_launch = tag.value.propagate_at_launch
#    }
#   }
# }

/*
    key                 = "Name"
    value               = format(local.Name, "asg")
    propagate_at_launch = true
*/