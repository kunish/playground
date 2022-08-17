resource "vsphere_content_library" "library" {
  name = "main"
  publication {
    published = true
  }
  storage_backing = [data.vsphere_datastore.datastore.id]
}

resource "vsphere_content_library_item" "ubuntu" {
  name       = "jammy-server-cloudimg-amd64"
  file_url   = "https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/jammy/current/jammy-server-cloudimg-amd64.ova"
  library_id = vsphere_content_library.library.id
}
