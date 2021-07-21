<%-- 
    Document   : AdminPage
    Created on : Jul 19, 2020, 11:01:00 AM
    Author     : Admin
--%>

<%@page import="Model.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html  >
    <head>
        <!-- Site made with Mobirise Website Builder v4.12.4, https://mobirise.com -->
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="generator" content="Mobirise v4.12.4, mobirise.com">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
        <link rel="shortcut icon" href="assets/images/logo.jpg" type="image/x-icon">
        <meta name="description" content="">


        <title>Admin Page</title>
        <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
        <link rel="stylesheet" href="assets/socicon/css/styles.css">
        <link rel="stylesheet" href="assets/tether/tether.min.css">
        <link rel="stylesheet" href="assets/datatables/data-tables.bootstrap4.min.css">
        <link rel="stylesheet" href="assets/dropdown/css/style.css">
        <link rel="stylesheet" href="assets/theme/css/style.css">
        <link rel="preload" as="style" href="assets/mobirise/css/mbr-additional.css"><link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
        <link href="styles/style.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="styles/base.css" rel="stylesheet" type="text/css" media="screen" />

        <!--<link href="style2/style_chart.css" rel="stylesheet" type="text/css"  />-->

    </head>
    <body>
        <c:choose>
            <c:when test="${account!=null}">
                <div id="container">
                    <header>
                        <hgroup class="intro">
                            <h1 class="title">Coffee Time</h1>
                        </hgroup>
<!--                        <div class="reservations"><br />
                            <div class="email-us"> <a class="button" href="index.jsp" title="Home page">Home</a> </div>
                        </div>-->
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />

                        <table border="0">

                            <tr>
                                <td><a class="button" href="MenuController?action=view" title="Home page">Manage Product</a></td>
                                <td><a class="button" href="manageBill?action=view" title="Manage Bill">Manage Bill</a></td>
                                <td><a class="button" href="manageCustomer?action=view" title="Manage Customer">Manage Customer</a></td>
                                <td><a class="button" href="index.jsp" title="Home page">Home</a></td>


                            </tr>

                        </table>

                        <br />
                        <br />
                        <br />
                    </header>
                </div>





                <section class="section-table cid-s59I9YgV1U" id="table1-3">

                    <div class="container container-table">
                        <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">
                            Sales Report (Bill Done)
                        </h2>

                        <div class="table-wrapper">

                            <div class="container scroll">
                                <form action="billDetail" method="post">
                                    <table class="table isSearch" cellspacing="0" data-empty="No matching records found">
                                        <thead>
                                            <tr class="table-heads ">

                                                <th class="head-item mbr-fonts-style display-7">
                                                    ID</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    DATE</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    TOTAL</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    VIEW</th>
<!--                                                <th class="head-item mbr-fonts-style display-7">
                                                    DELETE</th>-->

                                        </thead>
                                        <tbody>
                                            <c:set var="sum" value="0"/>
                                            <c:set var="sum1" value="0"/>
                                            <c:forEach items="${bill}" var="i">
                                                <c:set var="sum1" value="${sum1+i.getTotal()}"/>
                                                <c:set var="sum" value="${sum+1}"/>
                                                <tr> 
                                                    <td class="body-item mbr-fonts-style display-7">${i.getId()}</td>
                                                    <td class="body-item mbr-fonts-style display-7">${i.getDate()}</td>
                                                    <td class="body-item mbr-fonts-style display-7">${i.getTotal()}$</td>
                                                    <td class="body-item mbr-fonts-style display-7"><a href="billDetail?action=Detail&billId=${i.getId()}">Detail</a></td>
                                                    <!--<td class="body-item mbr-fonts-style display-7"><a href="billDetail?action=Delete&billId=${i.getId()}&option=1" onclick="return confirm('Are you sure?')">Delete</a></td>-->
                                                <tr>  
                                                </c:forEach>
                                            <tr> 
                                                <td class="body-item mbr-fonts-style display-7">Total ${sum} bill  =</td>
                                                <td class="body-item mbr-fonts-style display-7"></td>
                                                <td class="body-item mbr-fonts-style display-7">${sum1}$</td>
                                                <td class="body-item mbr-fonts-style display-7"></td>
                                                <!--<td class="body-item mbr-fonts-style display-7"></td>-->
                                            <tr>  
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>


                <section class="section-table cid-s59I9YgV1U" id="table1-3">

                    <div class="container container-table">
                        <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">
                            Feedback's Customer
                        </h2>
                        <div class="table-wrapper">

                            <div class="container scroll">
                                <table class="table isSearch" cellspacing="0" data-empty="No matching records found">
                                    <thead>
                                        <tr class="table-heads ">

                                            <th class="head-item mbr-fonts-style display-7">ID</th>
                                            <th class="head-item mbr-fonts-style display-7">NAME</th>
                                            <th class="head-item mbr-fonts-style display-7">SUBJECT</th>
                                            <th class="head-item mbr-fonts-style display-7">PHONE</th>
                                            <th class="head-item mbr-fonts-style display-7">MESSAGE</th>
                                            <th class="head-item mbr-fonts-style display-7">DISPLAY</th>
                                            <!--<th class="head-item mbr-fonts-style display-7"></th>-->
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <form action="FeedbackController" method="get">
                                        <c:forEach items="${feedback}" var="i">
                                            <tr> 
                                                <td class="body-item mbr-fonts-style display-7">${i.getId()}</td>
                                                <td class="body-item mbr-fonts-style display-7">${i.getName()}</td>
                                                <td class="body-item mbr-fonts-style display-7">${i.getSubject()}</td>
                                                <td class="body-item mbr-fonts-style display-7">${i.getPhone()}</td>
                                                <td class="body-item mbr-fonts-style display-7">${i.getMassage()}</td>
                                                <td class="body-item mbr-fonts-style display-7"><a href="FeedbackController?action=confirm&id=${i.getId()}&display=${i.isDisplay()}">${i.isDisplay()?"Yes":"No"}</a></td>
<!--                                                <td class="body-item mbr-fonts-style display-7">
                                                    <select name="display" size="2">
                                                        <option value="Yes">Yes</option>
                                                        <option value="No">No</option>
                                                    </select></td>-->
                                                <!--<td class="body-item mbr-fonts-style display-7"><input type="submit" name="confirm" value="Confirm" class="button"></td>-->
                                            </tr>  
                                        </c:forEach>

                                    </form>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </section>

                <script src="assets/web/assets/jquery/jquery.min.js"></script>
                <script src="assets/popper/popper.min.js"></script>
                <script src="assets/bootstrap/js/bootstrap.min.js"></script>
                <script src="assets/smoothscroll/smooth-scroll.js"></script>
                <script src="assets/tether/tether.min.js"></script>
                <script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
                <script src="assets/parallax/jarallax.min.js"></script>
                <script src="assets/datatables/jquery.data-tables.min.js"></script>
                <script src="assets/datatables/data-tables.bootstrap4.min.js"></script>
                <script src="assets/dropdown/js/nav-dropdown.js"></script>
                <script src="assets/dropdown/js/navbar-dropdown.js"></script>
                <script src="assets/theme/js/script.js"></script>

            </c:when>
            <c:when test="${account==null}">
                <span>  <h2 class="text-center">You have to Login!</h2>
                    <button type="button" class="button"><a href="Login.jsp">Login</a></button>
                </span>

            </c:when>
        </c:choose>




    </body>
</html>
