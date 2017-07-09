<?php
require 'components/get_listview_referrer.php';

require 'subclasses/sms_in.php';
$dbh_sms_in = new sms_in;
$dbh_sms_in->set_where("id='" . quote_smart($id) . "'");
if($result = $dbh_sms_in->make_query()->result)
{
    $data = $result->fetch_assoc();
    extract($data);

}

