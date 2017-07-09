<?php
//******************************************************************
//This file was generated by Cobalt, a rapid application development
//framework developed by JV Roig (jvroig@jvroig.com).
//
//Cobalt on the web: http://cobalt.jvroig.com
//******************************************************************
require 'path.php';
init_cobalt('View user role');

$page_title       = 'ListView: %%';
$db_subclass      = 'user_role';
$html_subclass    = 'user_role_html';
$arr_pkey_name    = array('role_id');
$results_per_page = LISTVIEW_RESULTS_PER_PAGE;

//user links / passport tags
$add_link         = 'Add user role';
$edit_link        = 'Edit user role';
$delete_link      = 'Delete user role';
$view_link        = 'View user role';

//pages - set to empty if you don't want to include them in the listview
$add_page         = 'add_user_role.php';
$edit_page        = 'edit_user_role.php';
$delete_page      = 'delete_user_role.php';
$view_page        = 'detailview_user_role.php';
$csv_page         = 'csv_user_role.php';
$report_page      = 'reporter_user_role.php';

//Extra entries under operations column
$operations_extra = 'operations_user_role.php';

//Formatting and alignment options for data columns
$arr_formatting   = array('role'=>'', 'description'=>'');
$arr_alignment    = array('role'=>'left', 'description'=>'left');

require 'components/listview_proc_head.php';
require 'components/listview_proc_html.php';
require 'components/listview_proc_query.php';
require 'components/listview_body_head.php';
require 'components/listview_body_data.php';
require 'components/listview_body_end.php';
