cat >> /etc/keepalived/keepalived.conf <<EOF
vrrp_script check_workers {
  script "/etc/keepalived/check_workers.sh"
  interval 3
  timeout 10
  fall 5
  rise 2
  weight -2
}

vrrp_instance VI_1 {
    state BACKUP
    interface ens3
    virtual_router_id 1
    priority 100
    advert_int 5
    authentication {
        auth_type PASS
        auth_pass mysecret
    }
    virtual_ipaddress {
        10.30.20.32
    }
    track_script {
        check_workers
    }
}
EOF