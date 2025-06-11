# Popsize Prestashop Module

## Install
- Clone this repo inside your prestashop `/modules` folder
```
apt-get update && \
apt-get install -y git
cd modules
git clone xxxxxxxxxxxxxxxx popsize
```
- Install the module inside `Modules > Module Manager` in your admin panel

## Dev
```
cd modules/popsize
apt-get update && \
apt-get install -y python3 python3-venv
python3 -m venv /opt/venv
source /opt/venv/bin/activate
/opt/venv/bin/pip install pre-commit

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
PATH="/root/.composer/vendor/bin:${PATH}"
composer require --dev phpstan/phpstan
composer require --dev prestashop/php-dev-tools
composer require --dev friendsofphp/php-cs-fixer
composer require --dev prestashop/header-stamp

php vendor/bin/prestashop-coding-standards cs-fixer:init
# php vendor/bin/prestashop-coding-standards phpstan:init  # ALREADY DONE AND MODIFIED
/opt/venv/bin/pre-commit install
```

## Pre-commit check
```
php vendor/bin/header-stamp --license=agpl.txt --exclude=vendor,tests,_dev
```
