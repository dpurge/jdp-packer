packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
  }
}

variable "ubuntu_version" {
  type    = string
  default = "22.04"
}

variable "build_version" {
  type    = string
  default = "1"
}

variable "dir_img" {
  type    = string
  default = "../img"
}

variable "dir_install" {
  type    = string
  default = "/install"
}

source "docker" "jdp-wsl-ubuntu" {
  image       = "ubuntu:${var.ubuntu_version}"
  commit      = false
  export_path = "${path.root}/${var.dir_img}/jdp-wsl-ubuntu-${var.ubuntu_version}-${var.build_version}.tar"
}

# post-processors {
# }

build {
  name = "jdp-wsl-ubuntu"
  sources = [
    "source.docker.jdp-wsl-ubuntu"
  ]

  post-processors {
    # post-processor "docker-tag" {
    #   repository = "dpurge/jdp-ubuntu"
    #   tags       = ["${var.ubuntu_version}-${var.build_version}"]
    # }

    # post-processor "docker-push" {}
  }

  provisioner "file" {
    destination = "${var.dir_install}"
    source      = "${path.root}/linux/installer"
  }

  provisioner "file" {
    destination = "${var.dir_install}/toolset.json"
    source      = "${path.root}/linux/toolset/ubuntu-${var.ubuntu_version}.json"
  }

  provisioner "shell" {
    environment_vars = [
      "DEBIAN_FRONTEND=noninteractive",
      "DIRECTORY_INSTALL=${var.dir_install}"
    ]
    execute_command  = "bash -c '{{ .Vars }} {{ .Path }}'"
    scripts          = [
      "${path.root}/linux/installer/base-system.sh",
      "${path.root}/linux/installer/rdp.sh",
      "${path.root}/linux/installer/dotnet-sdk.sh",
      "${path.root}/linux/installer/powershell.sh",
      "${path.root}/linux/installer/packer.sh",
      "${path.root}/linux/installer/terraform.sh",
      "${path.root}/linux/installer/terragrunt.sh",
      "${path.root}/linux/installer/kubectl.sh",
      "${path.root}/linux/installer/helm.sh",
      "${path.root}/linux/installer/golang.sh",
      "${path.root}/linux/installer/nodejs.sh",
      "${path.root}/linux/installer/python.sh"
      ]
  }
}
