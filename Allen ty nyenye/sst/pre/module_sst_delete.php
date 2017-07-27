<?php
require 'subclasses/module_sst.php';
$sst = new module_sst;
$sst->auto_test('delete');
$sst_script = $sst->script;