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

