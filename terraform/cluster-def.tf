provider "aws" {
    access_key = "ASIAIHCCHWDSLV736OSQ"
    secret_key = "Q2eQUinEGuVWDq1Ekc4kZg+NfwoxllpAQco944HY"
    region = "us-west-2"
}

resource "aws_instance" "example" 
{
    count = "${var.instance_count}"
    instance_type = "${var.instance_type}"
    ami = "ami-49d0cd79"
    security_groups = ["sg-87fe40e3"]
    subnet_id = "subnet-4591171c"
    key_name = "andrew-geo-dev-key-pair"
    user_data = "${template_file.userdata_node_provisioner.rendered}"
    tags 
    {
        Name = "aw-terraform-test"
    }
}

resource "template_file" "userdata_node_provisioner" 
{
    filename = "provision-ecs-host.sh"
    vars
    {
        instance_prefix = "${var.instance_prefix}"
        environment = "${var.environment}"
        ecs_cluster="${var.instance_prefix}"
    }
}
