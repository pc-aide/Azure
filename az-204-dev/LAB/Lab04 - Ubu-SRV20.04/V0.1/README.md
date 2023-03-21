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

3. Install the SDK
````sh
sudo apt-get update && \
sudo apt-get install -y dotnet-sdk-7.0
````

4. compil *.dll
````sh
# From publish_lab03
dotnet WebApplication1.dll
````

[<img src="https://i.imgur.com/U2dLfdh.png">](https://i.imgur.com/U2dLfdh.png)

5. new instance ssh
````sh
curl http://localhost:5000
````

[<img src="https://i.imgur.com/0yxxvA8.png">](https://i.imgur.com/0yxxvA8.png)

---

### install nginx
