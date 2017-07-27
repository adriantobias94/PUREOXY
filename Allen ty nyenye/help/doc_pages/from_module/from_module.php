<?php
require 'path.php';
init_cobalt();
require 'subclasses/from_module_doc.php';
$obj_doc = new from_module_doc;
$obj_doc->auto_doc();