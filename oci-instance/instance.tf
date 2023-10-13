resource "null_resource" "download_ssh_key" {
  provisioner "local-exec" {
    command = "oci os object get -ns griviwckdmis -bn bucket_terraform --name ssh-key-infra_oci.pub --file ~/.ssh/ssh-key-infra_oci.pub"
  }
}

resource "oci_core_instance" "compute" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  shape               = var.shape
  display_name        = var.display_name

  metadata = {
    ssh_authorized_keys = file("~/.ssh/ssh-key-infra_oci.pub")
  }

  create_vnic_details {
    subnet_id        = var.subnet_id_pub
    assign_public_ip = "true"
  }

  source_details {
    source_id   = var.source_ocid
    source_type = "image"
  }

  depends_on = [null_resource.download_ssh_key]
}
