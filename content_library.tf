resource "vsphere_content_library" "library" {
  name = "main"
  publication {
    published = true
  }
  storage_backing = [data.vsphere_datastore.datastore.id]
}

resource "vsphere_content_library_item" "ubuntu" {
  name       = "focal-server-cloudimg-amd64"
  file_url   = "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/focal/current/focal-server-cloudimg-amd64.ova"
  library_id = vsphere_content_library.library.id
}

resource "vsphere_content_library_item" "flatcar" {
  name       = "flatcar_production_vmware_ova"
  file_url   = "https://stable.release.flatcar-linux.net/amd64-usr/current/flatcar_production_vmware_ova.ova"
  library_id = vsphere_content_library.library.id
}
