<%-- 
    Document   : ManageProduct
    Created on : Nov 16, 2020, 7:44:36 PM
    Author     : Admin
--%>

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
        <style>
            #typenumber{
                width: 40px;
            }
        </style>
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
                                <td><a class="button" href="MenuController?action=view" title="Manage Product">Manage Product</a></td>

                                <td><a class="button" href="manageBill?action=view" title="Manage Bill">Manage Bill</a></td>
                                <td><a class="button" href="manageCustomer?action=view" title="Manage Customer">Manage Customer</a></td>
                                <td><a class="button" href="AdminController" title="Admin Home">Admin Home</a></td>
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


                        <div class="table-wrapper">

                            <div class="container scroll">
                                <div style="width: 70%;float: left;">
                                    <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">Product List</h2>
                                    <table class="table isSearch" cellspacing="0" data-empty="No matching records found">
                                        <thead>
                                            <tr class="table-heads ">

                                                <th class="head-item mbr-fonts-style display-7">
                                                    NO</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    ID</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    NAME</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    PRICE</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    DESCRIPTION</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    IMAGE</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    CATEGORY</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    UPDATE</th>
                                                <th class="head-item mbr-fonts-style display-7">
                                                    ACTION</th>
                                        </thead>
                                        <tbody>
                                        <form action="manageProduct" method="get">

                                            <c:set var="count" value="0"/>
                                            <c:forEach items="${product}" var="i">
                                                <c:set var="count" value="${count+1}"/>
                                                <td class="body-item mbr-fonts-style display-7">${count}</td>
                                                <td class="body-item mbr-fonts-style display-7"><input id="typenumber" type="text" name="id" value="${i.getId()}" readonly="readonly" /></td>
                                                <td class="body-item mbr-fonts-style display-7"><input  type="text" name="ProductName" value="${i.getName()}" /></td>
                                                <td class="body-item mbr-fonts-style display-7"><input id="typenumber"type="text" name="Price" value="${i.getPrice()}" /></td>
                                                <td class="body-item mbr-fonts-style display-7"><input type="text" name="Description" value="${i.getDescription()}" /></td>
                                                <td class="body-item mbr-fonts-style display-7"><input type="text" name="Image" value="${i.getImage()}" /></td>
                                                <td class="body-item mbr-fonts-style display-7">
                                                    <select name="CategoryName">
                                                        <c:forEach items="${category}" var="c">
                                                            <option <c:if test="${i.getCategory() eq c.getName()}">selected="selected"</c:if> value="${c.getName()}">${c.getName()}</option>
                                                        </c:forEach>
                                                    </select></td>
                                                <td class="body-item mbr-fonts-style display-7"><input type="submit" value="Update" name="action" /></td>
                                                <td class="body-item mbr-fonts-style display-7"><a href="manageProduct?action=Action&id=${i.getId()}&status=${i.isStatus()}" >${i.isStatus()?"Active":"DeActive"}</a></td>
                                                <tr>  
                                                </c:forEach>
                                        </form>
                                        <form action="manageProduct" method="get">
                                            <tr> 
                                                <td class="body-item mbr-fonts-style display-7">${count+1}</td>
                                                <td class="body-item mbr-fonts-style display-7"></td>
                                                <td class="body-item mbr-fonts-style display-7"><input type="text" name="ProductName" value="" /></td>
                                                <td class="body-item mbr-fonts-style display-7"><input id="typenumber" type="text" name="Price" value="" /></td>
                                                <td class="body-item mbr-fonts-style display-7"><input type="text" name="Description" value="" /></td>
                                                <td class="body-item mbr-fonts-style display-7"><input type="text" name="Image" value="" /></td>
                                                <td class="body-item mbr-fonts-style display-7"><select name="CategoryName">
                                                        <c:forEach items="${category}" var="c">
                                                            <option value="${c.getName()}">${c.getName()}</option>
                                                        </c:forEach>
                                                    </select></td>
                                                <td class="body-item mbr-fonts-style display-7"><input  type="submit" value="Add" name="action" /></td>
                                                <td class="body-item mbr-fonts-style display-7"></td>
                                            <tr>  
                                        </form>
                                        </tbody>
                                    </table>
                                </div>
                                <div style="width: 25%;float: right;">     
                                    <h2 class="mbr-section-title mbr-fonts-style align-center pb-3 display-2">ADD Category</h2>
                                    <form action="manageCategory">
                                        <input type="text" name="cateName" value="" />
                                        <input type="submit" value="Add" name="action" />
                                    </form>
                                    <label>${result}</label>
                                </div>


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
