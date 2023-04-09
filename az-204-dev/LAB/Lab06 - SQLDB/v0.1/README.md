# Lab06 - SQLDB

---

## URL
1. [SSMS-19](https://aka.ms/ssmsfullsetup)

---

## Acronym
1. DTU - Dabase Transaction Units
2. SSMS - SQL Server Management Studio

---

## Create SQL Database
### Basic
1. Database name : appDB
2. Server\Create new
  * server name : appserver<3000>.database.windows.net 
    * Server should no contain reserved workd 
    * The specified server name is not already in use
    * lower case only
3. Authentication method : Ue SQL auth
  * Server admin login : sqladmin
  * pwd : <string>
4. Compute + storage : 
  * Service tier : Basic (For lesss demanding workloads)
  
[<img src="https://i.imgur.com/HX5BUpe.png">](https://i.imgur.com/HX5BUpe.png)

---
 
### Networking8<6%l+o{s10W.uM`sE0S
 1. Connectivity method : Public endpoint
 2. Firwall rules
  * Allow Azure service & resource to access this server : yes
 * Add current client IP address : yes
 
[<img src="https://i.imgur.com/yXsk4R0.png">](https://i.imgur.com/yXsk4R0.png)

---
 
### NewProject
1. ASP.NET Core WebApp
2. Name : sqlApp
3. inNewProject\sqlApp\Tools\NuGet Package Manager\Manage NuGet Packages for solution...\Browse\Search\System.Data.SqlClient : Install
4. new folder, 'Models', 'Services'
 * Models\Product.cs
````cs
namespace sqlApp.Models
{
    public class Product
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public int Quantity { get; set; }
    }
}
````
5. Services\ProductService.cs
````cs
using sqlApp.Models;
using System.Data.SqlClient;

namespace sqlApp.Services
{
    public class ProductService
    {
        private static string db_source = "sql-svr-lab05.database.windows.net";
        private static string db_user = "sqladmin";
        private static string db_password = "8<6%l+o{s10W.uM`sE0S";
        private static string db_database = "app-db";

        private SqlConnection GetConnection()
        {
            var _builder = new SqlConnectionStringBuilder();
            _builder.DataSource = db_source;
            _builder.UserID = db_user;
            _builder.Password = db_password;
            _builder.InitialCatalog = db_database;
            return new SqlConnection(_builder.ConnectionString);
        }

        public List<Product> GetProducts()
        {
            SqlConnection conn = GetConnection();
            List<Product> _product_lst = new List<Product> ();

            string statement = "SELECT ProductID,ProductName,Quantity from Products";

            conn.Open();

            SqlCommand cmd = new SqlCommand (statement, conn);
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    Product product = new Product()
                    {
                        ProductID = reader.GetInt32(0),
                        ProductName = reader.GetString(1),
                        Quantity = reader.GetInt32(2),
                    };

                    _product_lst.Add(product);
                }
            }
            conn.Close();
            return _product_lst;
        }
    }
}
````
7. Index.cshtml
````cshtml
@page
@model IndexModel
@{
    ViewData["Title"] = "Home page";
}

<div class="text-center">
    <h1 class="display-4">This is a list of products</h1>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th scope="col">Product ID</th>
                <th scope="col">Product Name</th>
                <th scope="col">Quantity</th>
            </tr>
        </thead>
        <tbody>
            @foreach(var product in Model.Products)
            {
                <tr>
                    <th scope="row">@product.ProductID</th>
                    <td>@product.ProductName</td>
                    <td>@product.Quantity</td>
                </tr>
            }
        </tbody>
    </table>
</div>
````
6. Index.cshtml\Index.cshtml.cs
````cs
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using sqlApp.Models;
using sqlApp.Services;

namespace sqlApp.Pages
{
    public class IndexModel : PageModel
    {
        public List<Product> Products;
        public void OnGet()
        {
            ProductService productService = new ProductService();
            Products = productService.GetProducts();
        }
    }
}
````
8. F5 - run the code
         
[<img src="https://i.imgur.com/AHUnqHa.png">](https://i.imgur.com/AHUnqHa.png)

---
         
## Publishing WebApp
1. take lab05 - webApp
2. publish code sqlApp :
         
[<img src="https://i.imgur.com/YE9POsG.png">](https://i.imgur.com/YE9POsG.png)
         
3. test msEdge :
         
[<img src="https://i.imgur.com/a1spohe.png">](https://i.imgur.com/a1spohe.png)
         
