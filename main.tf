provider "aws" {
  region = "eu-west-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
module vpc {
    source = "./modules/vpc/"
}
module db {
    source = "./modules/db"
    subnet_group  = module.vpc.db_sub_grp
    db_sg = module.vpc.db_sg
}
module webserver {
    source = "./modules/webserver"
    subnet = module.vpc.public_subnet
    app_sg = module.vpc.app_sg
    #public_ip = # public_ip to db_server_name is part of the EXTENSION/STRETCH EXERCISE
    #endpoint = module.db.endpoint
    #username = module.db.username
    #password = module.db.password
    #dbname = module.db.dbname
   # db_server_name = module.db.instance_name
}