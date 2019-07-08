resource "random_string" "sql_admin_password" {
  length      = 16
  min_special = 1
  min_numeric = 1
}

resource "null_resource" "database" {
  triggers = {
    changed = false
  }

  provisioner "local-exec" {
    command = <<EOT
       Write-Host "Setting up database with password: ${random_string.sql_admin_password.result}"
    EOT

    interpreter = ["PowerShell", "-Command"]
  }
}
