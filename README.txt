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
    - NOTE: it will take several minutes
    
4. Note the "Kubectl Join" command.

5. Enter "Kubectl Join" comman on the Worker server.
- NOTE: it will take several minuets

6. Setup Port env:
 - "export PORT=<Enter_port>"
 - NOTE: Port should be in range between 30000-32767
 
7. Enter your Port ENV to the terraform.tfvar file:
 - "echo "port=$PORT" >> ./terraform.tfvars"
 
8. setup Terraform Environment by the command:
 - "terraform init"
 
9. use terraform plan command to make sure evreythink is good:
 - "terraform plan"
 
10. apply the Terraform plan by the command:
 - "terraform apply"

THATS IT!!!! you can reach the app by curl localhost:$PORT
