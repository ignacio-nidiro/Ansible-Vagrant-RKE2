Build a Kubernetes cluster using RKE2 via Ansible and Vagrant Locally
=========
```
               ,        ,  _______________________________
   ,-----------|'------'|  |                             |
  /.           '-'    |-'  |_____________________________|
 |/|             |    |
   |   .________.'----'    _______________________________
   |  ||        |  ||      |                             |
   \__|'        \__|'      |_____________________________|

|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
|________________________________________________________|

|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|
|________________________________________________________|
```

Easy MakeFile Lift Up
----------------------
This project was made for an easy lift up using a MakeFile, that have all the commands grouped on specific make commands. 

To lift up the kubernetes clusters you have to run:
``` 
make lift
```
This command will ask for you user password twice because it uses sudo commands

To verify the cluster status you have to run:
``` 
make get_nodes
```
This command will ask for the vagrant password that it`s _vagrant_

To drop down the kubernetes clusters and Vagrants VM´s use:
```
make down
```

Sources
----------
- [Rancher Federal RKE 2 Ansible Repository](https://github.com/rancherfederal/rke2-ansible)
- [Kubernetes Certification Guide](https://github.com/techiescamp/kubernetes-certification-guide)
