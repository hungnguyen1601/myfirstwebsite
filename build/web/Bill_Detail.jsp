<%-- 
    Document   : AdminPage
    Created on : Jul 19, 2020, 11:01:00 AM
    Author     : Admin
--%>

<%@page import="Model.BillDetail"%>
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
                        <div class="reservations"><br />
                            <div class="email-us"> <a class="button" href="index.jsp" title="Home page">Home</a> </div>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </header>
                </div>


                <section class="section-table cid-s59I9YgV1U" id="table1-3">
                    <h6 style="text-align: center"><%=request.getAttribute("customer") != null ? request.getAttribute("customer") : ""%></h6><br>F
                    <div class="container container-table">
                        <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">
                            Bill Detail
                        </h2>

                        <div class="table-wrapper">

                            <div class="container scroll">
                                <form action="billDetail" method="get">
                                    <table class="table isSearch" cellspacing="0" data-empty="No matching records found">
                                        <thead>
                                            <tr class="table-heads ">

                                                <th class="head-item mbr-fonts-style display-7">
                                                    Bill ID</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    Product ID</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    Name</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    Description</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    Price</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    Quantity</th>


                                        </thead>
                                        <tbody>
                                            <%if (request.getAttribute("list") != null) {
                                                    ArrayList<BillDetail> list = (ArrayList) request.getAttribute("list");
                                                    for (BillDetail i : list) {

                                            %>

                                            <tr> 
                                                <td class="body-item mbr-fonts-style display-7"><%=i.getBillID()%></td>
                                                <td class="body-item mbr-fonts-style display-7"><%=i.getProductID()%></td>
                                                <td class="body-item mbr-fonts-style display-7"><%=i.getName()%></td>
                                                <td class="body-item mbr-fonts-style display-7"><%=i.getDescription() == null ? "" : i.getDescription()%></td>
                                                <td class="body-item mbr-fonts-style display-7"><%=i.getPrice()%></td>
                                                <td class="body-item mbr-fonts-style display-7"><%=i.getQuantity()%></td>
                                            <tr>  

                                                <% }
                                                        }%>
                                        </tbody>
                                    </table>
                                </form>
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
