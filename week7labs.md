Deploy a proof-of-concept (POC) static website that is entirely automated with GCS (a GCP bucket) with some sample static assets I provide and an image of your choosing.

BASIC SETUP:
Navigate to where you want to do this project.
Make a folder for it if needed. This folder cannot be inside an existing local Git repo.
Open VS Code.
Open the terminal in VS Code.
Use pwd to make sure you are in the right folder.
Run this command to download the needed assets: curl https://raw.githubusercontent.com/aaron-dm-mcdonald/class7.5-notes/refs/heads/main/week-7/bam/download-assets.sh | sh
<img width="739" height="250" alt="image" src="https://github.com/user-attachments/assets/1de940d6-d0e3-4f25-8c36-103548845497" />


You will need to upload 4 objects to your bucket:

2 HTML documents: the index.html page and the error.html page
The CSS file to make the HTML look a little pretty
An image of your choice
This means 4 object resources. The code does not need to be "concise" -- copy and paste is fine as long as it works! It is more important that you write the code than that it uses every fancy Terraform feature that nobody expects you to know.

Assets provided: The 3 assets (the HTML files and the CSS file) are provided, so you only need to supply an image of your choice.
<img width="1721" height="789" alt="image" src="https://github.com/user-attachments/assets/593d9e38-d497-45a7-a701-f99301e4940d" />
<img width="1853" height="793" alt="image" src="https://github.com/user-attachments/assets/6274a9d8-e439-4812-acb3-0cf1d1f3d141" />
<img width="1843" height="930" alt="image" src="https://github.com/user-attachments/assets/aa9f529e-0362-4483-bd1b-315802c4abc2" />
<img width="1889" height="882" alt="image" src="https://github.com/user-attachments/assets/aa9e034a-c3b1-4d86-b277-7bfee213f9e2" />
<img width="1654" height="621" alt="image" src="https://github.com/user-attachments/assets/517e3366-689d-4546-ac13-738ddc657460" />

##################### GCP VPC CREATED ######################
<img width="1498" height="346" alt="image" src="https://github.com/user-attachments/assets/39dc3801-7246-4a1b-abf7-d7965d061315" />


##################### KEVINSITE7 BUCKET CREATED ###########
<img width="1472" height="724" alt="image" src="https://github.com/user-attachments/assets/eebc9bdd-71c0-4d9f-b98f-f084af7a6b6d" />

######################### OUTPUTS.TF ##########################
output "vpc_name" {
  value = google_compute_network.vpc_network.name
}

output "subnet_name" {
  value = google_compute_subnetwork.subnet.name
}

output "favorite_food" {
  value = local_file.favorite_food.content
}

################## FAVORITEFOOD.TXT ###########
<img width="247" height="287" alt="image" src="https://github.com/user-attachments/assets/545861e2-e41b-4d6b-8654-560c5966e923" />








Want to make the pages fancier? Go ahead -- but realize this is a static site, so only client-side code is supported. This is totally optional and you should not attempt it until your proof of concept is working.
<img width="1878" height="974" alt="image" src="https://github.com/user-attachments/assets/bade3a7e-8d31-404f-8f02-b0fd01664e0e" />
<img width="1889" height="944" alt="image" src="https://github.com/user-attachments/assets/e70ce919-b099-46fd-9267-83913557ad0f" />





Force destroy: On the bucket resource, make sure you set force_destroy = true to avoid headaches.

Naming: The image filename must match what is referenced in the HTML document. Ask your group leader if you are unsure, but it will be fairly obvious when you look at the HTML.

Making the bucket public: You will need to give the bucket the IAM role roles/storage.objectViewer with the member set to allUsers (we want everyone to be able to view the objects). Use the IAM member resource -- all 3 should work, but the IAM member is what is "correct" or "safe" in most cases.


############### RUNNING URL'S ###############
https://storage.googleapis.com/kevinsite7/index.html
https://storage.googleapis.com/kevinsite7/404.html
https://storage.googleapis.com/kevinsite7/style.css
https://storage.googleapis.com/kevinsite7/906bb27a-747b-4faa-8f85-4c249699f915.jpg





Make your provider.tf, backend.tf, and such as we have done in class.
Make a basic bucket in a main.tf file (or whatever you call it).
Make sure it works.
Get the static assets in the bucket with Terraform, one at a time, testing each time.
Make the bucket publicly accessible and make sure a friend in class can access the objects from their computer.
Adjust the settings on the bucket for static website hosting.
Work on the output for the index page's URL.

FOLLOW UP QUESTIONS:
When you are done, ideally you can answer the following:

Is Terraform a good tool to provision buckets?  Yes — Terraform is excellent for provisioning buckets.
Why?
Buckets are infrastructure, and Terraform is designed to manage infrastructure declaratively. Terraform ensures buckets are consistent, repeatable, and version‑controlled. You can recreate the same bucket in any environment (dev, test, prod) with one command. Terraform handles IAM, lifecycle rules, versioning, and website hosting in a predictable way.



Is Terraform an ideal tool to upload objects into buckets? Why or why not? When Creating buckets, Configuring bucket settings, Managing IAM policies, Enforcing naming conventions, and Automating infrastructure for teams. No — Terraform is not ideal for uploading objects.Terraform is infrastructure as code, not a file‑sync tool. Terraform uploads objects by treating them as resources, which causes problems.


Explain how you wrote the output (if you did). The output can be challenging. Terraform outputs can be tricky because, You must reference attributes that exist after the resource is created. Some attributes are nested (e.g., google_storage_bucket.website). Outputs must match the exact attribute names from the provider.
You must know the correct attribute (name, url, self_link, etc.). Some attributes don’t exist until after apply.





IAM and access:
Did you need uniform bucket-level access? Do you know what it does? Yes — enabling uniform bucket‑level access is recommended.  It creates uniform bucket‑level access, Disables object‑level ACLs, Forces all permissions to be controlled through IAM only, Simplifies security, and Prevents accidental public access through ACLs. Without uniform access, objects can have their own ACLs, which is messy and insecure.




Explain the IAM resource. Why is it needed? Was it hard to implement? Did the hints help? It is needed in order to grant public read access to all objects in the bucket. Required for static website hosting, and ensures anyone can load index.html in a browser. Without this IAM binding, your website would return 403 Forbidden.
Most students struggle with:
Choosing the correct IAM resource (member vs binding vs policy)
Using the correct role (storage.objectViewer)
Understanding that allUsers is a special identity


What setting did you change to enable static website hosting on the bucket? website {
  main_page_suffix = "index.html"
  not_found_page   = "404.html"
}
This tells GCP:
Serve index.html when someone visits the bucket URL
Serve 404.html for missing pages
You also must:
Make the bucket public
Upload the HTML files
Use the website endpoint, not the storage API endpoint


What changes could improve this infrastructure?
Use a backend for Terraform state
Enable versioning on the bucket
Add lifecycle rules
Use a module
Add labels
