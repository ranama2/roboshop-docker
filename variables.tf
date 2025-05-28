variable "instances" {
      default = {
            frontend = {
                  ami_id        = "ami-09c813fb71547fc4f"
                  instance_type = "t2.micro"
                  ansible_role  = "frontend-docker"
            }
            cart = {
                  ami_id        = "ami-09c813fb71547fc4f"
                  instance_type = "t2.micro"
                  ansible_role  = "cart-docker"
            }
            catalogue = {
                  ami_id        = "ami-09c813fb71547fc4f"
                  instance_type = "t2.micro"
                  ansible_role  = "catalogue-docker"
            }
            shipping = {
                  ami_id        = "ami-09c813fb71547fc4f"
                  instance_type = "t2.micro"
                  ansible_role  = "shipping-docker"
            }
            user = {
                  ami_id        = "ami-09c813fb71547fc4f"
                  instance_type = "t2.micro"
                  ansible_role  = "user-docker"
            }
            mysql = {
                  ami_id        = "ami-09c813fb71547fc4f"
                  instance_type = "t2.micro"
            }
            mongodb = {
                  ami_id        = "ami-09c813fb71547fc4f"
                  instance_type = "t2.micro"
            }
            rabbitmq = {
                  ami_id        = "ami-09c813fb71547fc4f"
                  instance_type = "t2.micro"
            }
            payment = {
                  ami_id        = "ami-09c813fb71547fc4f"
                  instance_type = "t2.micro"
                  ansible_role  = "payment-docker"
            }
            redis = {
                  ami_id        = "ami-09c813fb71547fc4f"
                  instance_type = "t2.micro"
            }
      }
}

variable "zone_id" {
      default = "Z040862479ELHY34R71D"
}
variable "vpc_security_group_ids" {
      default = ["sg-0fb33604adb27be45"]
}