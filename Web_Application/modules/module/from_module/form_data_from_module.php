<?php
require 'components/get_listview_referrer.php';

require 'subclasses/from_module.php';
$dbh_from_module = new from_module;
$dbh_from_module->set_where("id='" . quote_smart($id) . "'");
if($result = $dbh_from_module->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

