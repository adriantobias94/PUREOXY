<?php
require 'subclasses/air_data_sst.php';
$sst = new air_data_sst;
$sst->auto_test();
$sst_script = $sst->script;