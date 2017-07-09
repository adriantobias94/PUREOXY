<?php
session_start();
$_SESSION['message'] = '';
$mysqli = new mysqli('localhost','root','','pureoxy');

if ($_SERVER['REQUEST_METHOD'] == 'POST'){

  if ($_POST['password'] == $_POST['confirmpassword']){
    

    $username = $mysqli->real_escape_string($_POST['username']);
    $email = $mysqli->real_escape_string($_POST['email']);
    //$password = md5($_POST['password']);


      $first_name = $_POST['first_name'];
      $last_name = $_POST['last_name'];
      $middle_name = $_POST['middle_name'];
      $sql = "INSERT INTO person (first_name, last_name, middle_name) " . "VALUES ('" .$first_name."','".$last_name."','".$middle_name."')";


    if ($mysqli->query($sql) === true){
      $_SESSION['message'] = 'Registration Successful!';
        header("location: index.html");
    }
    else{
      $_SESSION['message'] = "User could not be added";
    }


  } 
}


?>
<!DOCTYPE html>
<html class="full" lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Pure Oxy</title>

       <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/form-elements.css">
        <link rel="stylesheet" href="assets/css/style.css">
            

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/the-big-picture.css" rel="stylesheet" style="">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Navigation -->
       <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Pure Oxy</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="about.html">About</a>
                    </li>
                    <li>
                        <a href="services.php">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                    <li>
                        <a href="register2.php">Register</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <!-- Page Content -->
<!-- <div class="container" style="background-color: #42a4f4;"> -->
<div class="col-lg-5">
  <a href ="index.html"><img src="images/Capture.png"  style="margin-top: 150px;" /></a>
</div>

<form class="form-horizontal col-lg-7 " method="POST" style="margin-top: 120px; padding-right: 100px; ">
<fieldset>

<!-- Form Name -->
<legend>Registration</legend>

<!-- Text input-->
<div class="form-group"> 
  <div class="col-md-4">
  <input id="first_name" name="first_name" type="text" placeholder="First Name" class="form-control input-md" required="">
  </div>
  <div class="col-md-4">
  <input id="middle_name" name="middle_name" type="text" placeholder="Middle Name" class="form-control input-md" required="">
  </div>
   <div class="col-md-4">
  <input id="last_name" name="last_name" type="text" placeholder="Last Name" class="form-control input-md" required="">
</div>
</div>

<!-- Text input-->

<div class="form-group">
  <div class="col-md-6">
  <input id="username" name="username" type="text" placeholder="Username" class="form-control input-md" required="">
  </div>
  <div class="col-md-6">
  <input id="email" name="email" type="text" placeholder="Email id" class="form-control input-md" required="">
  </div>
</div>

<!-- Password input-->
<div class="form-group">
  <div class="col-md-6">
    <input id="password" name="password" type="password" placeholder="Password" class="form-control input-md" required="">
  </div>
  <div class="col-md-6">
    <input id="confirmpassword" name="confirmpassword" type="password" placeholder="Re-enter Password" class="form-control input-md" required="">
    
  </div>
</div>
<!-- Text input-->
<div class="form-group">
  <div class="col-md-3"></div>
  <div class="col-md-6">
  <input id="contact" name="contact" type="text" placeholder="Contact no." class="form-control input-md" required="">
  </div>
  <div class="col-md-3"></div>
</div>


<!-- Button -->
<div class="form-group">
  <div class="col-md-3"></div>
  <div class="col-md-6">
    <input type="submit" value="Register" name="register" class="btn btn-block btn-primary" id="register" />
  </div>
  <div class="col-md-3"></div>  
</div>

</fieldset>
</form>
</div>

</body>

</html>
