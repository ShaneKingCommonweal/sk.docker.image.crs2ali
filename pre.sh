sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://registry.cn-shanghai.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
