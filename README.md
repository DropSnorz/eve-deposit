# php-mvc-ready
Light PHP business app structure built without framework

I can't say how many times i've set up new webapps or web services for pro, university and personnal projects. I decided to create a reusable app structure fitted with all basic stuff. (FrontController, templating, authentification,...)
Even if awesome php frameworks do all these stuff, sometimes you can't use them due to technical limitations or juste because your teacher sucks *Hey kiddies, frameworks not allowed for your webapp!*

I've followed main parts of this [great tutorial](https://github.com/PatrickLouys/no-framework-tutorial)

## Requirements

- Apache (+ mod_rewrite)
- PHP 5.6+
- Composer 

## Features

- MVT/MVC architecture
- Doctrine ORM
- Twig templating
- Bootstrap frontend
- Basic authentification

## Setup

1. Fork/Clone this repository
2. Run `composer install`
3. Update config.php and/or local.config.php file with your database properties and run `vendor/bin/doctrine orm:schema-tool:create`

or

3. Keep embedded sqlite database
