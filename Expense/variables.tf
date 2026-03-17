variable "instance_names"{
    type=list(string)
    default = ["mysql","backend","frontend"]
}

variable "common_tags"{
    type=map
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform ="true"
    }
}

variable "zone_id" {
    type = string
    default = "Z00056792N1BS97YFBDJ1"
}

variable "domain_name" {
    type = string
    default = "daws81s.online"
}