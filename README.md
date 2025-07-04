# containerlab-vyos
VyOS in containerlab

## start
Start the container with containerlab
```
./start_containerlab.sh
```

## deploy
Deploy and destroy the lab (in a container):
```
clab deploy -t containerlab/topo.clab.yaml
clab destroy --cleanup --topo containerlab/topo.clab.yaml
```

You can use make in the container:
```
make clab-deploy
make clab-destroy
```
## check
check:
```
$ make clab-deploy
🚀 Starting Containerlab test...
clab deploy -t containerlab/topo.clab.yaml
09:12:51 INFO Containerlab started version=0.68.0
09:12:51 INFO Parsing & checking topology file=topo.clab.yaml
09:12:51 INFO Creating docker network name=clab_mgmt IPv4 subnet=192.0.2.0/24 IPv6 subnet="" MTU=0
09:12:51 INFO Creating lab directory path=/home/sever/docker/containers/containerlab-vyos/containerlab/clab-vyoslab
09:12:51 INFO Creating container name=vyos1
09:12:51 INFO Creating container name=vyos2
09:12:51 INFO Creating container name=vyos3
09:12:52 INFO Created link: vyos2:eth2 ▪┄┄▪ vyos3:eth1
09:12:52 INFO Created link: vyos1:eth1 ▪┄┄▪ vyos2:eth1
09:12:52 INFO Adding host entries path=/etc/hosts
09:12:52 INFO Adding SSH config for nodes path=/etc/ssh/ssh_config.d/clab-vyoslab.conf
╭────────────────────┬───────────────────────────────────────────┬─────────┬────────────────╮
│        Name        │                 Kind/Image                │  State  │ IPv4/6 Address │
├────────────────────┼───────────────────────────────────────────┼─────────┼────────────────┤
│ clab-vyoslab-vyos1 │ linux                                     │ running │ 192.0.2.21     │
│                    │ ghcr.io/sever-sever/vyos-container:latest │         │ N/A            │
├────────────────────┼───────────────────────────────────────────┼─────────┼────────────────┤
│ clab-vyoslab-vyos2 │ linux                                     │ running │ 192.0.2.22     │
│                    │ ghcr.io/sever-sever/vyos-container:latest │         │ N/A            │
├────────────────────┼───────────────────────────────────────────┼─────────┼────────────────┤
│ clab-vyoslab-vyos3 │ linux                                     │ running │ 192.0.2.23     │
│                    │ ghcr.io/sever-sever/vyos-container:latest │         │ N/A            │
╰────────────────────┴───────────────────────────────────────────┴─────────┴────────────────╯
$ 
$
$ docker ps
CONTAINER ID   IMAGE                                       COMMAND        CREATED          STATUS          PORTS     NAMES
714ce98d3d10   ghcr.io/sever-sever/vyos-container:latest   "/sbin/init"   17 seconds ago   Up 16 seconds             clab-vyoslab-vyos3
1cab374852d4   ghcr.io/sever-sever/vyos-container:latest   "/sbin/init"   17 seconds ago   Up 16 seconds             clab-vyoslab-vyos2
dc0a8625cd7e   ghcr.io/sever-sever/vyos-container:latest   "/sbin/init"   17 seconds ago   Up 16 seconds             clab-vyoslab-vyos1
00a22cf2f61c   ghcr.io/srl-labs/clab                       "bash"         47 seconds ago   Up 46 seconds             competent_perlman
$ 

```
## connect
connect to the container:
```
$ docker exec -it clab-vyoslab-vyos1 su - vyos
vyos@vyos1:~$ 
vyos@vyos1:~$ show interfaces 
sudo: unable to resolve host vyos1: System error
Codes: S - State, L - Link, u - Up, D - Down, A - Admin Down
Interface    IP Address     MAC                VRF        MTU  S/L    Description
-----------  -------------  -----------------  -------  -----  -----  -------------
eth0         192.0.2.21/24  9a:4c:07:b9:48:60  default   1500  u/u
eth1         10.1.1.21/24   aa:c1:ab:24:cc:45  default   1500  u/u    Link-to-c2
lo           127.0.0.1/8    00:00:00:00:00:00  default  65536  u/u
             ::1/128
vyos@vyos1:~$ 

```
connect via SSH:
```
ssh -o StrictHostKeyChecking=no  vyos@192.0.2.21
```
