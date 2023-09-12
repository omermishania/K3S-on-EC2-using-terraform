curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --cluster-init" sh -s -
echo “export KUBECONFIG=/etc/rancher/k3s/k3s.yaml” >> ~/.bashrc