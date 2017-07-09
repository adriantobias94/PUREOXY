<?php
require_once 'from_module_dd.php';
class from_module_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'FROM_MODULE_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'from_module_html';
    var $data_subclass = 'from_module';
    var $result_page = 'reporter_result_from_module.php';
    var $cancel_page = 'listview_from_module.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_from_module.php';

    function __construct()
    {
        $this->fields        = from_module_dd::load_dictionary();
        $this->relations     = from_module_dd::load_relationships();
        $this->subclasses    = from_module_dd::load_subclass_info();
        $this->table_name    = from_module_dd::$table_name;
        $this->tables        = from_module_dd::$table_name;
        $this->readable_name = from_module_dd::$readable_name;
        $this->get_report_fields();
    }
}
