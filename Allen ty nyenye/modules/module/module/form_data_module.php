<?php
require 'components/get_listview_referrer.php';

require 'subclasses/module.php';
$dbh_module = new module;
$dbh_module->set_where("id='" . quote_smart($id) . "'");
if($result = $dbh_module->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

