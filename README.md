# README

**Shopzero** is a e-commerce website for delivering zero-waste products.
Built with powerful rails, maintaining rest architecture. We are opensource as you can see how we store your data & what we do with it.

* Ruby version : **2.5.3**
  > Ruby installation instruction for ubuntu 18.04 can be found on [DigitalOcean Article](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04)

* Rails version : **5.2.3**
  > Install rails with 
  ```
  gem install rails v=5.2.3
  ```   
  > run 
  ```
  gem update --system
  ```

* Make Sure  **Bundler >= 2.0.2**

* Make Sure  **nodejs** installed
  > run `sudo apt-get install nodejs`

* Configuration

  > Create a file PROJECT_DIR/config/application.yml similar to this. This file contains your environment values and secrets.
    ```yaml
    DATABASE_HOST_URL: "172.16.238.10"
    DATABASE_USERNAME: "root"
    DATABASE_PASSWORD: ""
    MAILER_ADDRESS: "smtp.yourmailer.org"
    MAILER_PORT: "587"
    MAILER_USERNAME: "yourapikey"
    MAILER_PASSWORD: "yourmailerpassword"
  ```    
  > To know more about Rails Action Mailer, [See Official Documentation](https://guides.rubyonrails.org/action_mailer_basics.html)    
  > You need to have native mysqlclient installed.   
  > run `sudo apt-get install libmysqlclient-dev mysql-client`

* Database creation : 
  
  run  `rails db:create`
  then `rails db:migrate`

* Deployment instructions
  
 > run `rails server` to start server.
  
* Usage

> run `rails routes` to check available routes.

