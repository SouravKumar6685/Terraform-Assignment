### **🔥 Terraform Interview Assignment (Real-World Scenario-Based) 🚀**  


## **📌 Assignment: Deploy a Highly Available Web Application on AWS using Terraform**  

### **📂 Task Overview:**  
You need to use **Terraform** to deploy a **highly available web application** on AWS. The setup should include:  
✅ **VPC Setup** with public & private subnets  
✅ **Load Balancer (ALB) for traffic distribution**  
✅ **Auto-Scaling Group (EC2 instances) with security groups**  
✅ **RDS Database (MySQL/PostgreSQL) in a private subnet**  
✅ **Redis (Elasticache) for caching**  
✅ **Terraform Remote Backend (S3 + DynamoDB for state locking)**  

---

## **📜 Task Breakdown (Step-by-Step)**  

### **1️⃣ VPC & Networking Setup**
- Create a **VPC** with **CIDR block `10.0.0.0/16`**  
- Configure **2 Public Subnets** (for Load Balancer) and **2 Private Subnets** (for EC2 & RDS)  
- Set up an **Internet Gateway (IGW) for public access**  
- Attach a **NAT Gateway for private subnets** to allow outbound internet access  

**🔹 Deliverables:**  
✔ Terraform `vpc.tf` file with VPC, subnets, IGW, NAT  

---

### **2️⃣ Application Load Balancer (ALB)**
- Deploy an **ALB** in **public subnets** to distribute traffic  
- Configure **ALB Listeners** for HTTP/HTTPS  
- Attach **security groups** to allow inbound traffic  

**🔹 Deliverables:**  
✔ Terraform `alb.tf` with ALB setup  

---

### **3️⃣ Auto Scaling Group (EC2)**
- Launch an **Auto Scaling Group (ASG)** with a **Launch Template**  
- Configure **Min = 2, Max = 5 EC2 instances**  
- Attach EC2 instances to the ALB target group  
- Add necessary **IAM roles and policies** for EC2  

**🔹 Deliverables:**  
✔ Terraform `asg.tf` with ASG & EC2 setup  

---

### **4️⃣ RDS Database Setup**
- Deploy **Amazon RDS (MySQL/PostgreSQL) in a private subnet**  
- Ensure the database is not publicly accessible  
- Enable **automatic backups & multi-AZ failover**  

**🔹 Deliverables:**  
✔ Terraform `rds.tf` file with RDS configuration  

---

### **5️⃣ Redis Caching (ElastiCache)**
- Deploy **AWS ElastiCache (Redis) in a private subnet**  
- Allow only EC2 instances to access Redis  
- Configure **TTL (Time-to-Live) for caching**  

**🔹 Deliverables:**  
✔ Terraform `redis.tf` file with Redis configuration  

---

### **6️⃣ Terraform State Management**
- Configure Terraform **Remote Backend using S3**  
- Use **DynamoDB Table for state locking** to prevent conflicts  
- Ensure **state is encrypted using AWS KMS**  

**🔹 Deliverables:**  
✔ Terraform `backend.tf` file for remote state  

---

## **💡 Evaluation Criteria**
✅ **Modular Terraform Code** (Using `modules`)  
✅ **Best Practices** (Security, remote state, DR strategies)  
✅ **Scalability** (Auto-scaling, Load Balancer)  
✅ **Performance Optimization** (Redis caching, database tuning)  

---

## **🚀 Final Thoughts**
This assignment **mirrors real-world DevOps challenges** checks my **Terraform** Knowledge.
