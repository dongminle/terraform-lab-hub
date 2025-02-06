locals {
  windows_kubectl_script = <<EOT
  cd ${var.kubectl_workspace}
  Invoke-WebRequest -OutFile kubectl.exe https://amazon-eks.s3.us-west-2.amazonaws.com/${module.blue_eks_cluster.cluster_version}/2021-07-05/bin/windows/amd64/kubectl.exe
  Move-Item -Path kubectl.exe -Destination $Env:ProgramFiles\kubectl.exe
  aws eks --region ${var.aws_region} update-kubeconfig --name ${module.blue_eks_cluster.cluster_name}
  EOT
 
  linux_kubectl_script = <<EOT
  #!/bin/bash
  cd ${var.kubectl_workspace}
  curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/${module.blue_eks_cluster.cluster_version}/2021-07-05/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  mv ./kubectl /usr/local/bin/
  aws eks --region ${var.aws_region} update-kubeconfig --name ${module.blue_eks_cluster.cluster_name}
  EOT
}

resource "null_resource" "kubectl_install" {
  provisioner "local-exec" {
    command = var.executor_os == "windows" ? local.windows_kubectl_script : local.linux_kubectl_script
  }

  depends_on = [module.blue_eks_cluster, data.aws_eks_cluster_auth.blue]
}

