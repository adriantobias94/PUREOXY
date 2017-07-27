<?php
require 'path.php';
init_cobalt();
require 'subclasses/air_data_doc.php';
$obj_doc = new air_data_doc;
$obj_doc->auto_doc();