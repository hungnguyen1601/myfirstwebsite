<%-- 
    Document   : dashboarch
    Created on : Mar 22, 2021, 9:33:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Target Material Design Bootstrap Admin Template</title> 
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="assets1/materialize/css/materialize.min.css" media="screen,projection" />
        <!-- Bootstrap Styles-->
        <link href="assets1/css/bootstrap.css" rel="stylesheet" />
        <!-- FontAwesome Styles-->
        <link href="assets1/css/font-awesome.css" rel="stylesheet" />
        <!-- Morris Chart Styles-->
        <link href="assets1/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- Custom Styles-->
        <link href="assets1/css/custom-styles.css" rel="stylesheet" />
        <!-- Google Fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="assets1/js/Lightweight-Chart/cssCharts.css"> 
    </head>

    <body>


        <div id="page-wrapper">
            <div class="header"> 
                <h1 class="page-header">
                    Dashboard
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Dashboard</a></li>
                    <li class="active">Data</li>
                </ol> 
            </div>
            
            <div id="page-inner">

                <div class="dashboard-cards"> 
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-3">

                            <div class="card horizontal cardIcon waves-effect waves-dark">
                                <div class="card-image red">
                                    <i class="material-icons dp48">import_export</i>
                                </div>
                                <div class="card-stacked red">
                                    <div class="card-content">
                                        <h3>84,198</h3> 
                                    </div>
                                    <div class="card-action">
                                        <strong>REVENUE</strong>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">

                            <div class="card horizontal cardIcon waves-effect waves-dark">
                                <div class="card-image orange">
                                    <i class="material-icons dp48">shopping_cart</i>
                                </div>
                                <div class="card-stacked orange">
                                    <div class="card-content">
                                        <h3>36,540</h3> 
                                    </div>
                                    <div class="card-action">
                                        <strong>SALES</strong>
                                    </div>
                                </div>
                            </div> 
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">

                            <div class="card horizontal cardIcon waves-effect waves-dark">
                                <div class="card-image blue">
                                    <i class="material-icons dp48">equalizer</i>
                                </div>
                                <div class="card-stacked blue">
                                    <div class="card-content">
                                        <h3>24,225</h3> 
                                    </div>
                                    <div class="card-action">
                                        <strong>PRODUCTS</strong>
                                    </div>
                                </div>
                            </div> 

                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">

                            <div class="card horizontal cardIcon waves-effect waves-dark">
                                <div class="card-image green">
                                    <i class="material-icons dp48">supervisor_account</i>
                                </div>
                                <div class="card-stacked green">
                                    <div class="card-content">
                                        <h3>88,658</h3> 
                                    </div>
                                    <div class="card-action">
                                        <strong>CUSTOMERS</strong>
                                    </div>
                                </div>
                            </div> 

                        </div>
                    </div>
                </div>


                <!-- /. ROW  --> 
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-7"> 
                        <div class="cirStats">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-6"> 
                                    <div class="card-panel text-center">
                                        <h4>Profit</h4>
                                        <div class="easypiechart" id="easypiechart-blue" data-percent="50" ><span class="percent">82%</span>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>	

                    </div>
                    <!--/.row-->
                    <div class="col-xs-12 col-sm-12 col-md-5"> 
                        <div class="row">
                            <div class="col-xs-12"> 
                                <div class="card">
                                    <div class="card-image donutpad">
                                        <div id="morris-donut-chart"></div>
                                    </div> 
                                    <div class="card-action">
                                        <b>Donut Chart Example</b>
                                    </div>
                                </div>	
                            </div>
                        </div>
                    </div>
                    <!--/.row-->
                </div>


                <footer>


                </footer>
            </div>
            <!-- /. PAGE INNER  -->
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
    <!-- /. WRAPPER  -->
    <!-- JS Scripts-->
    <!-- jQuery Js -->
    <script src="assets1/js/jquery-1.10.2.js"></script>

    <!-- Bootstrap Js -->
    <script src="assets1/js/bootstrap.min.js"></script>

    <script src="assets1/materialize/js/materialize.min.js"></script>

    <!-- Metis Menu Js -->
    <script src="assets1/js/jquery.metisMenu.js"></script>
    <!-- Morris Chart Js -->
    <script src="assets1/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets1/js/morris/morris.js"></script>


    <script src="assets1/js/easypiechart.js"></script>
    <script src="assets1/js/easypiechart-data.js"></script>

    <script src="assets1/js/Lightweight-Chart/jquery.chart.js"></script>

    <!-- Custom Js -->
    <script src="assets1/js/custom-scripts.js"></script> 


</body>
</html>
