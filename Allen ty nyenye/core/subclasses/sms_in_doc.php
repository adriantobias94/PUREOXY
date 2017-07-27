<?php
require_once 'documentation_class.php';
require_once 'sms_in_dd.php';
class sms_in_doc extends documentation
{
    function __construct()
    {
        $this->fields        = sms_in_dd::load_dictionary();
        $this->relations     = sms_in_dd::load_relationships();
        $this->subclasses    = sms_in_dd::load_subclass_info();
        $this->table_name    = sms_in_dd::$table_name;
        $this->readable_name = sms_in_dd::$readable_name;
        parent::__construct();
    }
}
