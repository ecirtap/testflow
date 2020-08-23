```
wget -qO- https://get.nextflow.io | bash
sudo mv nextflow /usr/local/bin/
cd /vagrant/nextflow
nextflow kuberun -r v0.0.7 ecirtap/testflow -v nextflow-claim:/srv
```
