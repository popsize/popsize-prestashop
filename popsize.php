<?php
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

        if (!Configuration::get('MYMODULE_NAME')) {
            $this->warning = $this->trans('No name provided', [], 'Modules.Mymodule.Admin');
        }
    }

    public function install()
    {
        return parent::install();
    }

}
