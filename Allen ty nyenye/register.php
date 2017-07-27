<?php

require 'path.php';
init_cobalt();
    $firstname = "";
    $lastname = "";
    $middlename ="";

if(xsrf_guard())
{

    require 'subclasses/person.php';
    $dbh_person = new person;
    $object_name = 'dbh_person';
    extract($arr_form_data);


    echo $_POST['btn_button'];
    if($_POST['btn_button'] == "submit")
    {

        $firstname = $_POST["firstname"];
        echo $firstname;
        $arr_form_data['first_name'] = $_POST['first_name'];
        $arr_form_data['middle_name'] = $_POST['middle_name'];
        $arr_form_data['last_name'] = $_POST['last_name'];
        log_action('Pressed submit button');
        $message .= $dbh_person->sanitize($arr_form_data)->lst_error;
        extract($arr_form_data);

        if($dbh_person->check_uniqueness($arr_form_data)->is_unique)
        {
   
        }
        else
        {
            $message = "Record already exists with the same primary identifiers!";
        }
        if($message=="")
        {
            $dbh_person->add($arr_form_data);
            redirect("index.html");
        }
    }
}
$html = cobalt_load_class('person_html');


?>
<!DOCTYPE html>
<html class="full" lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

       <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">
            

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/the-big-picture.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Start Bootstrap</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="about.html">About</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">
        <div class="row"> 
                 
                    <div class="col-md-12">  
                    <div class="modal-dialog">
                    <div class="modal-content">
                <div class="modal-header" align="center">
                    <img class="img-circle" id="img_logo" src="">
                    
                </div>
          
                    <form id="register-form" method="post" action="register.php">
                        <div class="modal-body">
                            <div id="div-register-msg">
                                <div id="icon-register-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-register-msg">Register an account.</span>
                            </div>

                               <div class="row">  
                                   <div class="col-xs-6 col-sm-6 col-md-6">
                                      <input type="text" name="first_name" id="first_name" class="form-control input-sm" placeholder="First Name">
                                  </div>  
                                   <div class="col-xs-6 col-sm-6 col-md-6">
                            
                                      <input type="text" name="last_name" id="last_name" class="form-control input-sm" placeholder="Last Name">
                                  </div> 
                                  <div class="col-xs-6 col-sm-6 col-md-6">
                                       <input type="text" name="middle_name" id="middle_name" class="form-control input-sm" placeholder="Middle Name">
                                  </div> 
                               </div> 

                               
                        </div>
                        <div class="modal-footer">
                            <div>
                                <button type="submit" class="btn btn-primary btn-lg btn-block" id="btn_button" value="submit">Register</button>
                            </div>
                            
                        </div>
                    </form>
            
                
            </div>
        </div>
                     </div>                
                </div>
                    </div>                            
                      
                 </div>    
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

     <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <script src="js/nye.js"></script>

</body>

</html>
