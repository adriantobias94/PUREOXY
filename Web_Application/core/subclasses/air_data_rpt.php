<?php
require_once 'air_data_dd.php';
class air_data_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'AIR_DATA_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'air_data_html';
    var $data_subclass = 'air_data';
    var $result_page = 'reporter_result_air_data.php';
    var $cancel_page = 'listview_air_data.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_air_data.php';

    function __construct()
    {
        $this->fields        = air_data_dd::load_dictionary();
        $this->relations     = air_data_dd::load_relationships();
        $this->subclasses    = air_data_dd::load_subclass_info();
        $this->table_name    = air_data_dd::$table_name;
        $this->tables        = air_data_dd::$table_name;
        $this->readable_name = air_data_dd::$readable_name;
        $this->get_report_fields();
    }
}
