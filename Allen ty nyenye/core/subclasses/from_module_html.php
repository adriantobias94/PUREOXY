<?php
require_once 'from_module_dd.php';
class from_module_html extends html
{
    function __construct()
    {
        $this->fields        = from_module_dd::load_dictionary();
        $this->relations     = from_module_dd::load_relationships();
        $this->subclasses    = from_module_dd::load_subclass_info();
        $this->table_name    = from_module_dd::$table_name;
        $this->readable_name = from_module_dd::$readable_name;
    }
}
