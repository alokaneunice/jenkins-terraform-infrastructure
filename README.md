# jenkins-terraform-infrastructure
Designing and implementing a two tier architecture on AWSusing Terraform, where Jenkins runs on a public subnet

### Architecture Diagram

![WhatsApp Image 2025-07-09 at 08 56 36_e4660df8](https://github.com/user-attachments/assets/5e520703-0632-433f-bf8a-a954c5e9f8d8)

### Steps taken

1. install and configure Terraform to interact with your AWS account
2. Using Vscode, create a directory for your Terraform configuration.
```
 mkdir jenkins-terraform-infrastructure
 cd jenkins-terraform-infrastructure
 ```
3. Create files like main.tf, provider.tf, vpc.tf, variables.tf, output.tf, etc. Theen add their respective file contents.
4. Initialize Terraform, format the script, vavilade the code, and plan the deployment.
```
 terraform init
 terraform fmt
 terraform validate
 terraform plan
```
5. Apply the configuration using the command below:
```
 terraform apply --auto-approve
```
6. After the completion of the deployment, Terraform will output the public URL for your Jenkins instance. Open the URL in your browser to access Jenkins.
7. Unlock the jenkins server by retrieving the key using the key displayed on the EC2 instance terminal and pasting it on the Jenkins unlock page
```
 sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
8. Set up Admin User, and install suggested plugins. Also configure Jenkins URL with your GitHub repository URL with a forward slash (/).
9. Click "save and finish" to finalize the setup. You will be redirected to the Jenkins dashboard,where you can start creating jobs and configuring your CI/CD pipelines.
10. Configure additional settings by installing plugins that the project might need, like Git, Docker etc, via "manage Jenkins" > "manage users". Set up global tools such as JDK, Maven, under "Manage Jenkins" > "Global Tool Configuration".
11. Create your first job by clicking on "New Item", select the type of project (pipeline), and configure accordingly. Click on apply and Save the pipeline configuration.
12. On the pipeline page, click "Build Now" to start the pipeline execution. View progress by clicking on the build number in the "Build History" on the left side bar.
13. Then click on "Console Output" to see the logs and the output of each stage.
14. Lastly , if the build fails, troubleshoot to diagnose any issues and fix accordingly to have a green build.
