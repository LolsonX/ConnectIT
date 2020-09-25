# README

## Description 
App created as a training in Ruby on Rails and to learn ReactJS. It is not going to be feature rich. It uses Swagger and OpenApi as a documentation. I've also tried to use TDD approach
### Tech stack
* Ruby 2.7.0
* Ruby on Rails 6
* ReactJS
* PostgreSQL
* Swagger UI and OpenApi 3
* RSpec
* Docker (TODO)
## Project setup
To setup app follow steps
Before starting prepare database and adjust config in `config/database.yml`. Next start API:
```bash
git clone https://github.com/LolsonX/ConnectIT.git
cd ConnectIT
bundle install
rails db:migrate
rails db:seed
rails s
```
And then start React App:
```bash
cd web-connect-it
npm install && npm start
```

## Api endpoints
TODO
Or just simply type `rails routes` to check available routes 
## Tests
To run tests simply type
```bash
rspec
```
## Ideas List
* Prepare docker image
* Prepare deploy and a simple CI/CD
* Integrate with 3rd party apps (FB, GitHub, Google)
* Integrate with Google Analytics if possible
* Find a function to monetize and integrate with payment gateway (PayU)

