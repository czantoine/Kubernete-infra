
sudo kubectl create namespace git
sudo helm repo add gitlab https://charts.gitlab.io
sudo helm install --namespace git gitlab-runner -f feature.yaml gitlab/gitlab-runner
