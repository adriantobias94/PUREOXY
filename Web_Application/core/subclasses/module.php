<?php
require_once 'module_dd.php';
class module extends data_abstraction
{
    var $fields = array();


    function __construct()
    {
        $this->fields     = module_dd::load_dictionary();
        $this->relations  = module_dd::load_relationships();
        $this->subclasses = module_dd::load_subclass_info();
        $this->table_name = module_dd::$table_name;
        $this->tables     = module_dd::$table_name;
    }

    function add($param)
    {
        $this->set_parameters($param);

        if($this->stmt_template=='')
        {
            $this->set_query_type('INSERT');
            $this->set_fields('id, location, city, latitude, longitude, number');
            $this->set_values("?,?,?,?,?,?");

            $bind_params = array('isssss',
                                 &$this->fields['id']['value'],
                                 &$this->fields['location']['value'],
                                 &$this->fields['city']['value'],
                                 &$this->fields['latitude']['value'],
                                 &$this->fields['longitude']['value'],
                                 &$this->fields['number']['value']);

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
            $this->set_update("location = ?, city = ?, latitude = ?, longitude = ?, number = ?");
            $this->set_where("id = ?");

            $bind_params = array('sssssi',
                                 &$this->fields['location']['value'],
                                 &$this->fields['city']['value'],
                                 &$this->fields['latitude']['value'],
                                 &$this->fields['longitude']['value'],
                                 &$this->fields['number']['value'],
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
