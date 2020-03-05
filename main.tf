variable do_token {}
variable domain_name {}

provider digitalocean {
    token = var.do_token
}

data "digitalocean_domain" "web" {
    name = var.domain_name
}

resource "digitalocean_record" "mme1" {
    domain = data.digitalocean_domain.web.name
    type   = "A"
    name   = "my-dns-record"
    value  = "mme1"
    ttl    = 30
}
