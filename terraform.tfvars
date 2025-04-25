enabled           = true
create_namespace  = true
namespace         = "argocd"
helm_chart_repo   = "https://argoproj.github.io/argo-helm"

helm_services = [
  {
    name          = "argo-cd"
    release_name  = "argo-cd"
    chart_version = "7.8.28" # this is the updated version
    settings      = {}
  }
]

settings = {}
