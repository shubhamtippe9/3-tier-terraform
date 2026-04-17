# 🚀 AWS 3-Tier Architecture using Terraform

This project demonstrates the deployment of a **3-tier architecture on AWS using Terraform**, following a **file-based Infrastructure as Code approach**.

The infrastructure is designed with proper **network segmentation, load balancing, and secure database access**.

---

## 📌 Project Description

This project provisions a complete AWS environment including:

- Custom VPC
- Public & Private Subnets
- Internet Gateway
- Route Tables
- Application Load Balancer (ALB)
- EC2 Instances (Web/App Layer)
- Database Subnets (RDS-ready)

---

## 🏗️ Architecture Overview

```
User → Application Load Balancer → Web Server (Public Subnet)
     → Application Server (Private Subnet)
     → Database (Private Subnet)
```

---

## 📁 Project Structure

```
3-tier-terraform/
│
├── vpc.tf                  # VPC configuration
├── subnet.tf               # Public & Private subnets
├── igw.tf                  # Internet Gateway
├── route_table_public.tf   # Public routing
├── alb.tf                  # Load Balancer setup
├── security_group.tf       # Security groups
├── ec2.tf                  # EC2 instances (Web/App)
├── variables.tf            # Input variables
├── terraform.tfvars        # Variable values
├── provider.tf             # AWS provider config
└── outputs.tf              # Output values
```

---

## 🌐 Network Design

- **6 Subnets Created:**
  - 2 Public Subnets (Web Tier)
  - 2 Private Subnets (Application Tier)
  - 2 Private Subnets (Database Tier)

- **Availability Zones:**
  - `us-east-1a`
  - `us-east-1b`

---

## 🔧 Resources Created

### 🟢 Networking
- VPC
- Internet Gateway
- Route Tables
- Subnet Associations

### 🟡 Compute
- EC2 Instances for Web/App layer

### 🔵 Load Balancing
- Application Load Balancer (ALB)
- Target Groups
- Listener (HTTP)

### 🔴 Security
- Security Groups with controlled inbound/outbound rules

---

## ⚙️ Prerequisites

Before running this project:

- Install Terraform (>= 1.x)
- Configure AWS CLI:
  ```bash
  aws configure
  ```
- IAM user with sufficient permissions

---

## 🚀 Deployment Steps

### 1️⃣ Clone Repository

```bash
git clone https://github.com/shubhamtippe9/3-tier-terraform.git
cd 3-tier-terraform
```

---

### 2️⃣ Initialize Terraform

```bash
terraform init
```

---

---

### 3️⃣ Plan Deployment

```bash
terraform plan
```

---

### 4️⃣ Apply Infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

---
### 5️⃣ Apply Infrastructure (Auto Approve)

```bash
terraform apply --auto-approve
```
---

## 🔐 Security Implementation

- Public access only to **Web Tier**
- Application & Database tiers are **private**
- Controlled traffic using **Security Groups**
- Database layer is **not exposed to internet**

---

## 📊 Key Highlights

✔ File-based Terraform structure (no modules)  
✔ Multi-AZ deployment  
✔ Scalable network design  
✔ Load balanced architecture  
✔ Production-like setup  

---

## 🧠 Learning Outcomes

- Terraform resource creation
- AWS networking (VPC, Subnets, Routing)
- Load Balancer configuration
- Multi-tier architecture design
- Infrastructure automation

---

## 🧹 Destroy Infrastructure

To delete all resources:

```bash
terraform destroy
```

---

## 👨‍💻 Author

**Shubham Tippe**  
Cloud & DevOps Learner  

🔗 GitHub:  
https://github.com/shubhamtippe9  

🔗 LinkedIn:  
https://www.linkedin.com/in/shubhamtippe9  

📧 Email: shubhamtippe9@gmail.com 
---

## 📜 License

This project is for educational and learning purposes.


## 🤝 Support

If you found this helpful:

⭐ Star this repository  
🍴 Fork it  
📢 Share with others  

---

## 💡 Future Improvements

- Add RDS database integration  
- Implement Auto Scaling Groups  
- Add CI/CD pipeline (GitHub Actions)  
- Monitoring with CloudWatch  

---

## 📢 Conclusion

This project is a **hands-on implementation of AWS 3-tier architecture using Terraform**, ideal for beginners and DevOps engineers looking to understand real-world infrastructure deployment.

---
