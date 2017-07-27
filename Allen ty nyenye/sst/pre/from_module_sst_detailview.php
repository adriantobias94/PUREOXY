<?php
require 'subclasses/from_module_sst.php';
$sst = new from_module_sst;
$sst->auto_test('detail_view');
$sst_script = $sst->script;