<?php

/**
 * Copyright since 2025 POPSIZE and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is licensed under the GNU Affero General Public License v3.0
 * that is bundled with this package in the file LICENSE.md.
 * It is also available at:
 * https://www.gnu.org/licenses/agpl-3.0.html
 * If you did not receive a copy of the license and cannot
 * obtain it, please email contact@popsize.ai.
 *
 * @author    POPSIZE and Contributors <contact@popsize.ai>
 * @copyright Since 2025 POPSIZE and Contributors
 * @license   https://www.gnu.org/licenses/agpl-3.0.html GNU Affero General Public License v3.0
 */
if (!defined('_PS_VERSION_')) {
    exit;
}

class Popsize extends Module
{
    public function __construct()
    {
        $this->name = 'popsize';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Nicolas Micaux';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = [
            'min' => '1.7.0.0',
            'max' => '8.99.99',
        ];
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->trans('Popsize', [], 'Modules.Mymodule.Admin');
        $this->description = $this->trans('Popsize sizing widget – provide smart size recommendations and reduce returns.', [], 'Modules.Mymodule.Admin');

        $this->confirmUninstall = $this->trans('Are you sure you want to uninstall?', [], 'Modules.Mymodule.Admin');
    }

    public function install()
    {
        if (parent::install() && $this->registerHook('displayBackOfficeHeader') && $this->registerHook('displayHeader')) {
            return true;
        }

        return false;
    }

    public function uninstall()
    {
        return parent::uninstall();
    }

    public function getContent()
    {
        if (Tools::isSubmit('savePopsizeConfig')) {
            $partnerId = Tools::getValue('PARTNER_ID');
            Configuration::updateValue('POPSIZE_PARTNER_ID', $partnerId);
        }

        $this->context->smarty->assign([
            'partner_id' => Configuration::get('POPSIZE_PARTNER_ID'),
            'token' => Tools::getAdminTokenLite('AdminModules'), // Add token here
        ]);

        return $this->display(__FILE__, 'views/templates/admin/configure.tpl');
    }

    public function hookDisplayBackOfficeHeader($params)
    {
        $partnerId = Configuration::get('POPSIZE_PARTNER_ID');

        if (empty($partnerId)) {
            $this->context->controller->warnings[] = $this->l('Please configure your Popsize account.') . " <a href='https://partners.popsize.ai' target='_blank'>Click here</a>";
        }
    }

    public function hookDisplayHeader($params)
    {
        $partnerId = Configuration::get('POPSIZE_PARTNER_ID');

        // Only run this on the product page
        $controller = Dispatcher::getInstance()->getController();
        if ($controller !== 'product') {
            return;
        }

        if (!empty($partnerId)) {
            $this->context->smarty->assign([
                'partner_id' => $partnerId,
            ]);

            return $this->display(__FILE__, 'views/templates/hook/head.tpl');
        }
    }
}
