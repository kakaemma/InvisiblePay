# InvisiblePay
InvisiblePay is Micro-Service Application that helps automate the process of converting from one currency to another currency

### Installation

1. Run `git clone https://github.com/kakaemma/InvisiblePay.git` to clone this repository

3. Create an account with `https://currencylayer.com/` and obtain an access key

4. Create an account with `https://vatlayer.com/` and obtain the access key for VAT

5. Run `cp config/application.yml.sample config/application.yml` to create the `application.yml` file.

6. Add the access key's you obtained from step `3` and `4` to the respective keys in the application.yml file

7. Install [Docker](https://docs.docker.com/v17.09/engine/installation/) to your operating system

8. Install a REST CLIENT e.g [post man](https://www.getpostman.com/downloads/) 

8. Run `cp config/application.yml.sample config/application.yml` to create the `application.yml` file.

10. Add the access key's you obtained from step `3` and `4` to the respective keys in the application.yml file

11. Install [Docker](https://docs.docker.com/v17.09/engine/installation/) to your operating system. This will allow for running docker containers on your machine 

12. Install a REST CLIENT e.g [post man](https://www.getpostman.com/downloads/) 



*Note* Update the access keys in your application.yml file

```yml
access_key: 'your_access_key'
vat_access_key: your_vat_access_key
```

### Running the application
If you have **Docker** installed, follow these steps
* On you terminal switch to the project folder and run the following commands
* -> Run `docker-compose build` to build all the services

* -> Run `docker-compose up` to start the application

* -> Start postman

* -> Use the rest client to access the endpoints

**Without Docker Installed**
* On your terminal (Am assuming your in the projects directory), Run the command below

* -> `rail s` to start the server

### API resources

These are the endpoints available in My Diary API

HTTP Method | Endpoint | Description| 
------------ | ------------- | ------------- 
POST| /api/currency/convert |Convert source currency to target currency
POST| /api/currency/vat |Validate VAT input
GET| /api/time/now |Get current time

### API Overview
##### Covert Currency
*   Using `post localhost:8081/api/currency/convert`
*   **Params**
   ```json
   {
   	"amount": "1000",
   	"source_currency": "USD",
   	"target_currency": "UGX"
   }
   
   ```
   **Results:**  The converted amount in JSON
   ```json
   {
       "amount": 3689000
   }
   ```
#### Validate VAT number
*   Using `post localhost:8081/api/currency/vat`
* **Params**
```json
{
	"vat_number": "ATU66889218"
}

```
**Results:**  The country code for associated with the VAT number
```json
{
	"country_code": "AT"
}
```   
#### Current Time
*   Using `get localhost:8081/api/time/now`

**Results:**  The current time as json
```json
{
    "current_time": "06:04:47 UTC +0000"
}
```  


### Tests

* Run test with `rspec spec` or `bundle exec rspec`
* Open the coverage folder and load the index page using a browser to view coverage

### Limitations

* With a free account from **currencylayer** , you will only be able to have your source currency as **USD**
* The application is still under development
