cat >> /etc/haproxy/haproxy.cfg <<EOF
frontend frontend
  bind *:80
  mode tcp
  option tcplog
  default_backend backend

backend backend
  mode tcp
  option tcplog
  balance roundrobin
  server production-worker-01 10.30.20.23:80
  server production-worker-02 10.30.20.24:80
  server production-worker-03 10.30.20.25:80
EOF