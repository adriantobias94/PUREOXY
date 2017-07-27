<?php
require 'path.php';
init_cobalt();
require 'subclasses/module_doc.php';
$obj_doc = new module_doc;
$obj_doc->auto_doc();