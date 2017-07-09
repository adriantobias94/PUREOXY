<?php
require_once 'module_dd.php';
class module_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'MODULE_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'module_html';
    var $data_subclass = 'module';
    var $result_page = 'reporter_result_module.php';
    var $cancel_page = 'listview_module.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_module.php';

    function __construct()
    {
        $this->fields        = module_dd::load_dictionary();
        $this->relations     = module_dd::load_relationships();
        $this->subclasses    = module_dd::load_subclass_info();
        $this->table_name    = module_dd::$table_name;
        $this->tables        = module_dd::$table_name;
        $this->readable_name = module_dd::$readable_name;
        $this->get_report_fields();
    }
}
