<%-- 
    Document   : CartDetail
    Created on : Jul 19, 2020, 10:46:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Coffee Time</title>
        <link href="styles/style.css" rel="stylesheet" type="text/css" media="screen" />
        <link rel="shortcut icon" href="assets/images/logo.jpg" type="image/x-icon">
        <link rel="stylesheet" href="style2/style2.css">
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    </head>
    <body>
        <div id="container">
            <header>
                <nav>
                    <ul id="nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="about.jsp" >About</a></li>
                        <li><a href="MenuController" class="current">Menu</a></li>
                        <li><a href="gallery.jsp">Gallery</a></li>
                        <li><a href="reviews.jsp">Reviews</a></li>
                        <li><a href="LoadFBController">Contact</a></li>
                    </ul>
                </nav>
            </header>

            <div id="contentCart" class="wrapper">
                <div class="inner mainContent">
                    <p class="titleMainConten">Order Information</p>
                    <div id="listProduct" class="itemContent">
                        <p class="titleListProduct">List product</p>
                        <div class="outsideContent">
                            <div class="insideContent insideProduct">
                                <div id="ListProduct">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="name">Product name</th>
                                                <th class="text-left price left-10">Price</th>
                                                <th class="text-center quantity left-10">Quantity</th>
                                            </tr>
                                        </thead>
                                        <tbody id="BODY_LIST_ORDER">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>



                    <div id="OrderForm" class="itemContent">
                        <p class="titleForm">Billing Information</p>
                        <div class="outsideContent">
                            <div class="insideContent insideForm">
                                <form id="ORDERFORM" >
                                    <div class="itemForm">
                                        <input type="phone" id="txt_Phone" value="${phone}">
                                        <label for="name">Your phone number</label>
                                    </div>
                                    <div class="itemForm">
                                        <input type="text" id="txt_Name" value="${name}">
                                        <label for="name">Your full name</label>
                                    </div>
                                    <div class="itemForm">
                                        <input type="text" id="txt_Address" value="${address}">
                                        <label for="name">Your address</label>
                                    </div>

                                    <!-- <div class="itemForm">
                                        <textarea name="" id="" cols="30" rows="10" id="txt_Note"></textarea>
                                        <label for="name">Note</label>
                                        </div>-->


                                    <div class="itemForm">
                                        <button id="btn_ODER" class="btnOrder">Order</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>


                <jsp:include page="Footer.jsp"></jsp:include>

            </div>
            <script src="js/cartDetail.js"></script>
    </body>
</html>
