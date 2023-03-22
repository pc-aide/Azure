# Lab04 - Ubu-SRV20.04

---

## Doc
1. [dotnet/core/install/linux-ubuntu](https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu)

---

## Steps
### Export project local machine
1. from our Lab03, publish your project to local machine :

[<img src="https://i.imgur.com/EKxlWGl.png">](https://i.imgur.com/EKxlWGl.png)

2. Publish yoiur application to a local folder of file share :

[<img src="https://i.imgur.com/l0ZqMTn.png">](https://i.imgur.com/l0ZqMTn.png)

3. location :

[<img src="https://i.imgur.com/FHUWG2B.png">](https://i.imgur.com/FHUWG2B.png)

4. Publish

[<img src="https://i.imgur.com/G0MXgb8.png">](https://i.imgur.com/G0MXgb8.png)

5. folder publish_lab03 on ubuntu 20.04 :

[<img src="https://i.imgur.com/RS8KCcf.png">](https://i.imgur.com/RS8KCcf.png)

----

### Install .NET Core
1. Add the Microsoft package repository
````sh
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y apt-transport-https && sudo apt-get update && sudo apt-get install -y aspnetcore-runtime-6.0
rm packages-microsoft-prod.deb
````

2. compil *.dll
````sh
# From publish_lab03
dotnet WebApplication1.dll
````

[<img src="https://i.imgur.com/U2dLfdh.png">](https://i.imgur.com/U2dLfdh.png)

3. new instance ssh
````sh
curl http://localhost:5000
````

[<img src="https://i.imgur.com/0yxxvA8.png">](https://i.imgur.com/0yxxvA8.png)

---

### install nginx
0. swithc default page nginx by our webApp (ASP Dotnet Core 6.0)

[<img src="https://i.imgur.com/H0fRxsU.png">](https://i.imgur.com/H0fRxsU.png)


2. stop service nginx
3. edit /etc/nginx/sites/available/default
````sh
# Ln48 Location / { }
location / {
  proxy_pass http://localhost:5000;
  proxy_http_version 1.1;
  proxy_set_header Upgrade $http_upgrade;
  proxy_set_header Connection keep-alive;
  proxy_set_header Host $host;
  proxy_cache_bypass $http_upgrade;
}
```
4. start nginx
5. dotnet WebApplication1.dll

6. we have our webApp again :
 
[<img src="https://i.imgur.com/pfeEdQn.png">](https://i.imgur.com/pfeEdQn.png)
