Requierments:
  - 2 Ubuntu 20.04 Focal Fossa LTS

Setup:
1. Clone the following path by git and get thru the new path:
  - git clone https://github.com/oriexsol/SwishAI.git
  then:
  cd ./SwishAI
2. Add execute permission to the following files:
  - kube-master-start.sh
  - kube_setup.sh
  - terraform-setup.sh
3. Run the following scripts as Root:
    ALL NODES:
    a. kube_setup.sh
    Master Only!:
    a. terraform-setup.sh
    b. kube-master-start.sh
4. Note the "Kubectl Join" command.

    

