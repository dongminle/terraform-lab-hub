variable "aws_region" {
  description = "Region for AWS"
  type        = string
  default     = "ap-northeast-2"
}

# kubectl을 설치하는 호스트의 OS
variable "executor_os" {
  description = "The name of OS that the code is running"
  type = string
  default = "windows"
  validation {
    condition     = contains(["windows", "linux"], var.executor_os)
    error_message = "The executer_os variable must be either 'windows' or 'linux'."
  }
}

# kubectl을 설치할 위치를 지정합니다.
variable "kubectl_workspace" {
  description = "A workspace name to install kubectl client"
  type        = string
  default = "C:\\"
}

