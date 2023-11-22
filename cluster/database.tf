resource "digitalocean_database_cluster" "postgres-cluster" {
  name       = "postgres-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = var.do_region
  node_count = 1
  private_network_uuid = digitalocean_vpc.cluster.id
}

resource "digitalocean_database_firewall" "postgres-cluster-firewall" {
  cluster_id = digitalocean_database_cluster.postgres-cluster.id

  rule {
    type  = "ip_addr"
    value = digitalocean_vpc.cluster.ip_range
  }
}