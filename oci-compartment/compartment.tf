resource "oci_identity_compartment" "tf-compartment" {
    compartment_id = var.compartment_ocid
    description = "compartment lab01"
    name = var.name_compartment
}