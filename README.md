# InvisiblePay
InvisiblePay is Micro-Service Application that helps automate the process of converting from one currency to another currency
### External Dependencies

This micro service is written with Ruby using the Ruby on Rails framework. You need Ruby version 2.4.1 for the application to work correctly
### Installation

Please make sure you have **Ruby(v 2.4.1)** installed. Take the following steps to setup the application on your local machine:


1. Run `git clone https://github.com/kakaemma/InvisiblePay.git` to clone this repository

2. Run `bundle install` to install all required gems

3. Run `cp config/application.yml.sample config/application.yml` to create the `application.yml` file.

4. Create an account with `https://currencylayer.com/` and obtain an access key

5. Install postman


*Note* Update the access key in your application.yml file

```yml
access_key: 'your_access_key'
```

### Running the application
* Run `rails s` to start the application

* Start postman 

* Visit: localhost:8081/api/currency/convert in post man
* Set the body to send JSON(application/json)

### API resources

These are the endpoints available in My Diary API

HTTP Method | Endpoint | Description| 
------------ | ------------- | ------------- 
POST| /api/currency/convert |Convert source currency to target currency

### Tests

* Run test with `rspec spec` or `bundle exec rspec`

### Limitations

* With a free account from **currencylayer** , you will only be able to have your source currency as **USD**

