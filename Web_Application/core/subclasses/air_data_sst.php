<?php
require_once 'sst_class.php';
require_once 'air_data_dd.php';
class air_data_sst extends sst
{
    function __construct()
    {
        $this->fields        = air_data_dd::load_dictionary();
        $this->relations     = air_data_dd::load_relationships();
        $this->subclasses    = air_data_dd::load_subclass_info();
        $this->table_name    = air_data_dd::$table_name;
        $this->readable_name = air_data_dd::$readable_name;
        parent::__construct();
    }
}
