<?php
require_once 'air_data_dd.php';
class air_data extends data_abstraction
{
    var $fields = array();


    function __construct()
    {
        $this->fields     = air_data_dd::load_dictionary();
        $this->relations  = air_data_dd::load_relationships();
        $this->subclasses = air_data_dd::load_subclass_info();
        $this->table_name = air_data_dd::$table_name;
        $this->tables     = air_data_dd::$table_name;
    }

    function add($param)
    {
        $this->set_parameters($param);

        if($this->stmt_template=='')
        {
            $this->set_query_type('INSERT');
            $this->set_fields('id, quality, co2, co, percentage, time, date, module_id');
            $this->set_values("?,?,?,?,?,?,?,?");

            $bind_params = array('isssissi',
                                 &$this->fields['id']['value'],
                                 &$this->fields['quality']['value'],
                                 &$this->fields['co2']['value'],
                                 &$this->fields['co']['value'],
                                 &$this->fields['percentage']['value'],
                                 &$this->fields['time']['value'],
                                 &$this->fields['date']['value'],
                                 &$this->fields['module_id']['value']);

            $this->stmt_prepare($bind_params);
        }

        $this->stmt_execute();
        return $this;
    }

    function edit($param)
    {
        $this->set_parameters($param);

        if($this->stmt_template=='')
        {
            $this->set_query_type('UPDATE');
            $this->set_update("quality = ?, co2 = ?, co = ?, percentage = ?, time = ?, date = ?, module_id = ?");
            $this->set_where("id = ?");

            $bind_params = array('sssissii',
                                 &$this->fields['quality']['value'],
                                 &$this->fields['co2']['value'],
                                 &$this->fields['co']['value'],
                                 &$this->fields['percentage']['value'],
                                 &$this->fields['time']['value'],
                                 &$this->fields['date']['value'],
                                 &$this->fields['module_id']['value'],
                                 &$this->fields['id']['value']);

            $this->stmt_prepare($bind_params);
        }
        $this->stmt_execute();

        return $this;
    }

    function delete($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('DELETE');
        $this->set_where("id = ?");

        $bind_params = array('i',
                             &$this->fields['id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        return $this;
    }

    function delete_many($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('DELETE');
        $this->set_where("");

        $bind_params = array('',
                             );

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        return $this;
    }

    function select()
    {
        $this->set_query_type('SELECT');
        $this->exec_fetch('array');
        return $this;
    }

    function check_uniqueness($param)
    {
        $this->set_parameters($param);
        $this->set_query_type('SELECT');
        $this->set_where("id = ?");

        $bind_params = array('i',
                             &$this->fields['id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        if($this->num_rows > 0) $this->is_unique = FALSE;
        else $this->is_unique = TRUE;

        return $this;
    }

    function check_uniqueness_for_editing($param)
    {
        $this->set_parameters($param);


        $this->set_query_type('SELECT');
        $this->set_where("id = ? AND (id != ?)");

        $bind_params = array('ii',
                             &$this->fields['id']['value'],
                             &$this->fields['id']['value']);

        $this->stmt_prepare($bind_params);
        $this->stmt_execute();
        $this->stmt_close();

        if($this->num_rows > 0) $this->is_unique = FALSE;
        else $this->is_unique = TRUE;

        return $this;
    }
}
