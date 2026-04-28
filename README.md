In this lab I created a static host websitefocused on using Terraform to provision Google Cloud Storage infrastructure, configure IAM permissions, enable static website hosting, and manage Terraform state using a remote backend. The goal was to understand how Terraform interacts with GCP resources and where Terraform is (and is not) the ideal tool.

Terraform is an excellent tool for provisioning Cloud Storage buckets because buckets are infrastructure resources, and Terraform is designed for declarative infrastructure management.Terraform ensures consistent, repeatable bucket creation across environments. Bucket settings such as versioning, lifecycle rules, IAM, and website hosting can be fully automated and version‑controlled.

Conclusion: Terraform is a good tool for creating and configuring buckets.

Why Terraform is not ideal for uploads
Terraform treats objects as resources, so any file change forces a re‑upload. It is slow and inefficient for large or frequently updated files.Terraform is not a file‑sync tool.Tools like gsutil, CI/CD pipelines, or Cloud Console are better suited for content uploads.

When Terraform is acceptable:  
Uploading a small number of static files (e.g., index.html) for a static website.

This lab demonstrated how Terraform can effectively provision and configure GCP storage infrastructure while also highlighting its limitations for content management. It reinforced best practices around IAM, state management, and static website hosting.
