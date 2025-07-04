# containerlab-vyos
VyOS in containerlab

Start and destroy lab:
```
clab deploy -t containerlab/topo.clab.yaml
clab destroy --cleanup --topo containerlab/topo.clab.yaml
```

You can use make in the container:
```
make clab-deploy
make clab-destroy
```