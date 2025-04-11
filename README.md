# Terraform EC2 Automation with Shell Script & GitHub Actions

This project demonstrates how to create a Terraform module for provisioning an EC2 instance, integrate it with a shell script, and fully automate the deployment process using GitHub Actions.

## 🚀 Project Overview

- ✅ Create and configure a reusable **Terraform module** to provision an EC2 instance.
- ✅ Use a **Shell script** to trigger or manage Terraform operations.
- ✅ Automate infrastructure provisioning via **GitHub Actions CI/CD**.

This setup allows DevOps engineers to streamline the infrastructure deployment process using Infrastructure as Code (IaC) with automation pipelines.

---


---

## ⚙️ How It Works

1. **Terraform Code**:
   - Defines the AWS EC2 instance setup including AMI, instance type, and other parameters.

2. **Shell Script (`deploy.sh`)**:
   - Handles `terraform init`, `plan`, and `apply` commands.
   - Can be executed locally or triggered via automation.

3. **GitHub Actions Workflow**:
   - Automatically runs the shell script whenever changes are pushed to the repo.
   - Ensures CI/CD for infrastructure.

---

## ✅ Requirements

- AWS Account with access keys
- GitHub Repository
- GitHub Actions enabled
- Terraform installed locally (for testing)
- IAM Role/Secrets configured in GitHub Actions for AWS access

---

## 📦 How to Use

### 1. Clone the Repository

```bash
git clone https://github.com/baig892/terra-bash-auto.git
cd terra-bash-auto
2. Run Locally (Optional)
bash
Copy
Edit
cd scripts
chmod +x deploy.sh
./deploy.sh
3. Trigger GitHub Actions
Push your changes to the main branch.

GitHub Actions will automatically run and deploy your infrastructure.

📌 Notes
Make sure to configure AWS credentials in GitHub repository secrets (AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY).

Destroy resources manually if needed to avoid unnecessary charges.

📧 Contact
Created by Aliyan Ullah Baig
For any queries or suggestions, feel free to reach out on GitHub

