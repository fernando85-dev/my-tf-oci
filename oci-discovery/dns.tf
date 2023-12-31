## This configuration was generated by terraform-provider-oci

resource oci_dns_view export_vcn_lab01_1 {
  compartment_id = oci_artifacts_container_configuration.export_container_configuration.id
  defined_tags = {
    "Oracle-Tags.CreatedBy" = "default/fernando.almeida@service.com.br"
    "Oracle-Tags.CreatedOn" = "2023-10-13T12:28:17.512Z"
  }
  display_name = "vcn_lab01"
  freeform_tags = {
  }
  #scope = <<Optional value not found in discovery>>
}

resource oci_dns_resolver export_vcn_lab01_2 {
  compartment_id = oci_artifacts_container_configuration.export_container_configuration.id
  defined_tags = {
    "Oracle-Tags.CreatedBy" = "default/fernando.almeida@service.com.br"
    "Oracle-Tags.CreatedOn" = "2023-10-13T12:28:17.512Z"
  }
  display_name = "vcn_lab01"
  freeform_tags = {
  }
  resolver_id = "ocid1.dnsresolver.oc1.sa-saopaulo-1.amaaaaaajnwwqraagcmxlckjhz3di5gribkhjbmzl5z2zta3fzydow4zu32q"
  #scope = <<Optional value not found in discovery>>
}

