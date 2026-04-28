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






Want to make the pages fancier? Go ahead -- but realize this is a static site, so only client-side code is supported. This is totally optional and you should not attempt it until your proof of concept is working.

Force destroy: On the bucket resource, make sure you set force_destroy = true to avoid headaches.

Naming: The image filename must match what is referenced in the HTML document. Ask your group leader if you are unsure, but it will be fairly obvious when you look at the HTML.

Making the bucket public: You will need to give the bucket the IAM role roles/storage.objectViewer with the member set to allUsers (we want everyone to be able to view the objects). Use the IAM member resource -- all 3 should work, but the IAM member is what is "correct" or "safe" in most cases.



Make your provider.tf, backend.tf, and such as we have done in class.
Make a basic bucket in a main.tf file (or whatever you call it).
Make sure it works.
Get the static assets in the bucket with Terraform, one at a time, testing each time.
Make the bucket publicly accessible and make sure a friend in class can access the objects from their computer.
Adjust the settings on the bucket for static website hosting.
Work on the output for the index page's URL.

FOLLOW UP QUESTIONS:
When you are done, ideally you can answer the following:

Is Terraform a good tool to provision buckets?
Is Terraform an ideal tool to upload objects into buckets? Why or why not?
Explain how you wrote the output (if you did). The output can be challenging.
IAM and access:
Did you need uniform bucket-level access? Do you know what it does?
Explain the IAM resource. Why is it needed? Was it hard to implement? Did the hints help?
What setting did you change to enable static website hosting on the bucket?
What changes could improve this infrastructure?
