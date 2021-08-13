resource "vsphere_content_library" "library" {
  name = var.vsphere_content_library_name
  publication {
    published = true
  }
  storage_backing = [data.vsphere_datastore.datastore.id]
}

resource "vsphere_content_library_item" "template" {
  name       = var.vm_content_library_template_name
  file_url   = var.vm_content_library_template_url
  library_id = vsphere_content_library.library.id
}
