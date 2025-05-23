module "argocd" {
  source = "git::https://github.com/tothenew/terraform-helm-argocd.git"

  enabled = true
  helm_services = [
    {
      name          = "argocd"
      chart_version = "7.8.28"
      release_name  = "argo-cd"
      settings = {
        "server" = {
          "extraArgs" = [
              "--insecure",
          ]
          "ingress" = {
            "enabled" = true
            "https"   = true
            "annotations" = {
              "kubernetes.io/ingress.class"                    = "alb"
              "alb.ingress.kubernetes.io/scheme"               = "internet-facing"
              "alb.ingress.kubernetes.io/target-type"          = "ip"
              "alb.ingress.kubernetes.io/success-codes"        = "200"
              "alb.ingress.kubernetes.io/healthcheck-protocol" = "HTTP"
              "alb.ingress.kubernetes.io/certificate-arn"      = "arn:aws:acm:region-code:account-id:certificate/xyz"
              "alb.ingress.kubernetes.io/listen-ports"         = "[{\"HTTP\": 80}, {\"HTTPS\":443}]"
              "alb.ingress.kubernetes.io/actions.ssl-redirect" = "{\"Type\": \"redirect\", \"RedirectConfig\": { \"Protocol\": \"HTTPS\", \"Port\": \"443\", \"StatusCode\": \"HTTP_301\"}}"
            }
          }
        }
      }
    }
  ]
}
