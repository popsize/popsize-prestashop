# Popsize Prestahsop Module

## Install
- Clone this repo inside your prestashop `/modules` folder
- Install the module inside `Modules > Module Manager` in your admin panel

## Dev
```
cd modules/popsize
apt-get update && \
apt-get install -y python3 python3-venv git
python3 -m venv /opt/venv
source /opt/venv/bin/activate
/opt/venv/bin/pip install pre-commit

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
PATH="/root/.composer/vendor/bin:${PATH}"
composer global require phpstan/phpstan \
&& composer global require friendsofphp/php-cs-fixer

/opt/venv/bin/pre-commit install
```