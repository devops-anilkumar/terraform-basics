variable "sample" {
    default  =  "welcome to terraform learning"
}

output "sample_op" {
     value   =   var.sample
}

output "sample_output" {
     value   =  "value of sample variable is ${var.sample}"
}

# a variable can be accessed without ${} as well, if it's is not accompained in any sentence if you want to call it you can just reffer it as var.variablename

variable "integer" {
    default = 1000
}

output "number" {
      value = var.integer
}

#LIST VARIABLE
variable "sample_list" {
    default = [
       "terraform",
       "training",
       "pulumi",
       "cloud formation",
       120,
       true,
       "anil kumar"
    ]
}

# from the above list block, data in that block can be of any type
output "sample_list_op" {
    value = "welcome to ${var.sample_list[0]} training annd duration of the training is ${var.sample_list[4]} hours"
}

#MAP VARIABLE
variable "sample_map" {
    default = {
        mode = "online" ,
        training = "devops" ,
        timings = "0730_AM_IST"
    }
}

output "sample_map_op" {
    value = "welcome to ${var.sample_map["mode"]} - ${var.sample_map["training"]} training and the batch timings are ${var.sample_map["timings"]}"
}

#DECLEARING AN EMPTY VARIABLRE

variable "city" {}

output "city_name_op" {
    value =  var.city
}
