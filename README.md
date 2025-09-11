# Popsize Prestashop Module

## Install
- Clone this repo inside your prestashop `/modules` folder
```
apt-get update && \
apt-get install -y git zip
cd modules
git clone git@github.com:popsize/popsize-prestashop.git popsize
```
- Install the module inside `Modules > Module Manager` in your admin panel

## Dev
```
cd popsize
apt-get update && \
apt-get install -y python3 python3-venv
python3 -m venv /opt/venv
source /opt/venv/bin/activate
/opt/venv/bin/pip install pre-commit
```

## Build & deploy

```bash
cd popsize
./build.sh
```

This will create a `build/popsize.zip` file containing only the necessary files for distribution:
- `views/` - Template files
- `agpl.txt` - License file
- `index.php` - Security file
- `LICENSE` - License text
- `logo.png` - Module logo
- `popsize.php` - Main module file
Files can be modified to include/exclude other files as needed in the `build.sh` script.

The zip file can be uploaded directly to PrestaShop's Module Manager for installation.

## OLD: Composer & pre-commit checks
```
# FROM THERE, BELOW BREAKS EVERYTHING IN PRESTASHOP ADMIN PANEL...
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
