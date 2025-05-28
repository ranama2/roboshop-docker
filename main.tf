module "ec2" {
  for_each = var.instances
  source   = "./modules/ec2"

  ami_id                  = each.value["ami_id"]
  //env                     = var.env
  instance_type           = each.value["instance_type"]
  name                    = each.key
  zone_id                 = var.zone_id
  //ansible_role            = lookup(each.value, "ansible_role", each_key)
}