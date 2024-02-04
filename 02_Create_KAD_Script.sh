cat >> /etc/keepalived/check_workers.sh <<EOF
#!/bin/sh

errorExit() {
  echo "*** $@" 1>&2
  exit 1
}

curl --silent --max-time 2 --insecure https://localhost:80/ -o /dev/null || errorExit "Error GET https://localhost:80/"
if ip addr | grep -q 10.30.20.32; then
  curl --silent --max-time 2 --insecure https://10.30.20.32:80/ -o /dev/null || errorExit "Error GET https://10.30.20.32:80/"
fi
EOF

chmod +x /etc/keepalived/check_workers.sh