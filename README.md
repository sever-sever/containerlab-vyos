# containerlab-vyos
VyOS in containerlab

Start continer with containerlab
```
./start_containerlab.sh
```

Start and destroy lab (in container):
```
clab deploy -t containerlab/topo.clab.yaml
clab destroy --cleanup --topo containerlab/topo.clab.yaml
```

You can use make in the container:
```
make clab-deploy
make clab-destroy
```