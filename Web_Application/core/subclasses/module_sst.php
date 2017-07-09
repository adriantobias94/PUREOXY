<?php
require_once 'sst_class.php';
require_once 'module_dd.php';
class module_sst extends sst
{
    function __construct()
    {
        $this->fields        = module_dd::load_dictionary();
        $this->relations     = module_dd::load_relationships();
        $this->subclasses    = module_dd::load_subclass_info();
        $this->table_name    = module_dd::$table_name;
        $this->readable_name = module_dd::$readable_name;
        parent::__construct();
    }
}
