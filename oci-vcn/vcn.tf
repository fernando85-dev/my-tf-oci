# VCN
resource "oci_core_vcn" "my_vcn" {
  compartment_id = var.compartment_id
  cidr_block     = var.vcn_cidr
  display_name   = var.display_name
}

# SUBNET PUB
resource "oci_core_subnet" "public_subnet" {
  compartment_id      = var.compartment_id
  vcn_id              = oci_core_vcn.my_vcn.id
  cidr_block          = var.subnet_public_cidr
  display_name        = var.display_name_subnet_pub
  route_table_id      = oci_core_vcn.my_vcn.default_route_table_id
  security_list_ids   = [oci_core_vcn.my_vcn.default_security_list_id]
  availability_domain = var.availability_domain
}

# SUBNET PRIV
resource "oci_core_subnet" "private_subnet" {
  compartment_id      = var.compartment_id
  vcn_id              = oci_core_vcn.my_vcn.id
  cidr_block          = var.subnet_private_cidr
  display_name        = var.display_name_subnet_prv
  route_table_id      = oci_core_vcn.my_vcn.default_route_table_id
  security_list_ids   = [oci_core_vcn.my_vcn.default_security_list_id]
  availability_domain = var.availability_domain
  prohibit_public_ip_on_vnic = true
}

# INTERNET GATEWAY
resource "oci_core_internet_gateway" "my_igw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.my_vcn.id
  display_name   = var.display_name_internet_gateway
}

# NAT GATEWAY
resource "oci_core_nat_gateway" "my_nat_gw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.my_vcn.id
  display_name   = var.display_name_nateway_gateway
}