<?php
require_once 'sms_in_dd.php';
class sms_in_rpt extends reporter
{
    var $tables='';
    var $session_array_name = 'SMS_IN_REPORT_CUSTOM';
    var $report_title = '%%: Custom Reporting Tool';
    var $html_subclass = 'sms_in_html';
    var $data_subclass = 'sms_in';
    var $result_page = 'reporter_result_sms_in.php';
    var $cancel_page = 'listview_sms_in.php';
    var $pdf_reporter_filename = 'reporter_pdfresult_sms_in.php';

    function __construct()
    {
        $this->fields        = sms_in_dd::load_dictionary();
        $this->relations     = sms_in_dd::load_relationships();
        $this->subclasses    = sms_in_dd::load_subclass_info();
        $this->table_name    = sms_in_dd::$table_name;
        $this->tables        = sms_in_dd::$table_name;
        $this->readable_name = sms_in_dd::$readable_name;
        $this->get_report_fields();
    }
}
