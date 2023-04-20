# test_run

---

## Test/Run
### Get
1. Test/Run\Input
  * HTTP Method : Get
  * Query
````json
{
    "name" : "Azure"
}
````
* Nom : name
* Value : Azure
* Run

[<img src="https://i.imgur.com/XVDXtx3.png">](https://i.imgur.com/XVDXtx3.png)

[<img src="https://i.imgur.com/mhK9rYW.png">](https://i.imgur.com/mhK9rYW.png)

[<img src="https://i.imgur.com/87ipXTb.png">](https://i.imgur.com/87ipXTb.png)

* O/P :

[<img src="https://i.imgur.com/MEXYWk0.png">](https://i.imgur.com/MEXYWk0.png)

* Change value for "Alan"
* O/P :
````txt
Hello, Alan. This HTTP triggered function executed successfully.
````

### Post
1. HTTP method : Post
2. Body
3. Run
````json
{
    "name" : "Azure"
}
````

[<img src="https://i.imgur.com/8yqVdsQ.png">](https://i.imgur.com/8yqVdsQ.png)

* O/P :
````txt
Hello, Azure. This HTTP triggered function executed successfully.
````

* Get Block :
````csx
string name = req.Query["name"];
````

* Post Block
````csx
string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
dynamic data = JsonConvert.DeserializeObject(requestBody);
name = name ?? data?.name;
````

* Status 200
````csx
string responseMessage = string.IsNullOrEmpty(name)
    ? "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response."
            : $"Hello, {name}. This HTTP triggered function executed successfully.";

        return new OkObjectResult(responseMessage);
````

### Get function URL
1. Copy URL-Address :

[<img src="https://i.imgur.com/CRCjOZw.png">](https://i.imgur.com/CRCjOZw.png)

2. Function URL `https://portal.azure.com/#view/WebsitesExtension/FunctionMenuBlade/~/code/resourceId/%2Fsubscriptions%2F331c70ad-a492-431b-81ee-327ef79cea03%2FresourceGroups%2Frg-lab07%2Fproviders%2FMicrosoft.Web%2Fsites%2Ffun-wwzc1476%2Ffunctions%2FhttpTrigger`
3. add to the end : `&name=All` :
````txt
https://fun-wwzc1476.azurewebsites.net/api/httpTrigger?code=8ztxAhO5aMJP6KJBIt-ZeAJ5mOA1AeKfc0reh3-0_Sc0AzFu-298bw==&name=Alan
````

[<img src="https://i.imgur.com/n8xnOqE.png">](https://i.imgur.com/n8xnOqE.png)
