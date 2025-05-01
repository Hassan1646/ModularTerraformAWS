output "my_ip" {
    value = module.webserver.public_ip
}

output "myEP" {
    value = module.db.myEP
}