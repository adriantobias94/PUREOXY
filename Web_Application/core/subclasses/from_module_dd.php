<?php
class from_module_dd
{
    static $table_name = 'from_module';
    static $readable_name = 'From Module';

    static function load_dictionary()
    {
        $fields = array(
                    'id' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'integer',
                                          'length'=>20,
                                          'required'=>FALSE,
                                          'attribute'=>'primary key',
                                          'control_type'=>'none',
                                          'size'=>'60',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'ID',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>FALSE,
                                          'char_set_method'=>'generate_num_set',
                                          'char_set_allow_space'=>FALSE,
                                          'extra_chars_allowed'=>'-',
                                          'allow_html_tags'=>FALSE,
                                          'trim'=>'trim',
                                          'valid_set'=>array(),
                                          'date_elements'=>array('','',''),
                                          'date_default'=>'',
                                          'list_type'=>'',
                                          'list_settings'=>array(''),
                                          'rpt_in_report'=>TRUE,
                                          'rpt_column_format'=>'normal',
                                          'rpt_column_alignment'=>'center',
                                          'rpt_show_sum'=>TRUE),
                    'body' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'varchar',
                                          'length'=>255,
                                          'required'=>TRUE,
                                          'attribute'=>'',
                                          'control_type'=>'textbox',
                                          'size'=>'60',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Body',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>TRUE,
                                          'char_set_method'=>'',
                                          'char_set_allow_space'=>TRUE,
                                          'extra_chars_allowed'=>'',
                                          'allow_html_tags'=>FALSE,
                                          'trim'=>'trim',
                                          'valid_set'=>array(),
                                          'date_elements'=>array('','',''),
                                          'date_default'=>'',
                                          'list_type'=>'',
                                          'list_settings'=>array(''),
                                          'rpt_in_report'=>TRUE,
                                          'rpt_column_format'=>'normal',
                                          'rpt_column_alignment'=>'left',
                                          'rpt_show_sum'=>FALSE),
                    'time' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'varchar',
                                          'length'=>255,
                                          'required'=>TRUE,
                                          'attribute'=>'',
                                          'control_type'=>'textbox',
                                          'size'=>'60',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Time',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>TRUE,
                                          'char_set_method'=>'',
                                          'char_set_allow_space'=>TRUE,
                                          'extra_chars_allowed'=>'',
                                          'allow_html_tags'=>FALSE,
                                          'trim'=>'trim',
                                          'valid_set'=>array(),
                                          'date_elements'=>array('','',''),
                                          'date_default'=>'',
                                          'list_type'=>'',
                                          'list_settings'=>array(''),
                                          'rpt_in_report'=>TRUE,
                                          'rpt_column_format'=>'normal',
                                          'rpt_column_alignment'=>'left',
                                          'rpt_show_sum'=>FALSE),
                    'number' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'varchar',
                                          'length'=>11,
                                          'required'=>TRUE,
                                          'attribute'=>'',
                                          'control_type'=>'textbox',
                                          'size'=>'60',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Number',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>TRUE,
                                          'char_set_method'=>'',
                                          'char_set_allow_space'=>TRUE,
                                          'extra_chars_allowed'=>'',
                                          'allow_html_tags'=>FALSE,
                                          'trim'=>'trim',
                                          'valid_set'=>array(),
                                          'date_elements'=>array('','',''),
                                          'date_default'=>'',
                                          'list_type'=>'',
                                          'list_settings'=>array(''),
                                          'rpt_in_report'=>TRUE,
                                          'rpt_column_format'=>'normal',
                                          'rpt_column_alignment'=>'left',
                                          'rpt_show_sum'=>FALSE),
                    'module_id' => array('value'=>'',
                                          'nullable'=>FALSE,
                                          'data_type'=>'integer',
                                          'length'=>20,
                                          'required'=>TRUE,
                                          'attribute'=>'foreign key',
                                          'control_type'=>'drop-down list',
                                          'size'=>'60',
                                          'drop_down_has_blank'=>TRUE,
                                          'label'=>'Module',
                                          'extra'=>'',
                                          'companion'=>'',
                                          'in_listview'=>TRUE,
                                          'char_set_method'=>'generate_num_set',
                                          'char_set_allow_space'=>FALSE,
                                          'extra_chars_allowed'=>'-',
                                          'allow_html_tags'=>FALSE,
                                          'trim'=>'trim',
                                          'valid_set'=>array(),
                                          'date_elements'=>array('','',''),
                                          'date_default'=>'',
                                          'list_type'=>'sql generated',
                                          'list_settings'=>array('query' => "SELECT module.id AS `Queried_id`, module.city, module.location FROM module ORDER BY `city`, `location`",
                                                                     'list_value' => 'Queried_id',
                                                                     'list_items' => array('city', 'location'),
                                                                     'list_separators' => array()),
                                          'rpt_in_report'=>TRUE,
                                          'rpt_column_format'=>'normal',
                                          'rpt_column_alignment'=>'center',
                                          'rpt_show_sum'=>TRUE)
                       );
        return $fields;
    }

    static function load_relationships()
    {
        $relations = array(array('type'=>'1-1',
                                 'table'=>'module',
                                 'alias'=>'module_id',
                                 'link_parent'=>'id',
                                 'link_child'=>'module_id',
                                 'link_subtext'=>array('city','location'),
                                 'where_clause'=>''));

        return $relations;
    }

    static function load_subclass_info()
    {
        $subclasses = array('html_file'=>'from_module_html.php',
                            'html_class'=>'from_module_html',
                            'data_file'=>'from_module.php',
                            'data_class'=>'from_module');
        return $subclasses;
    }

}