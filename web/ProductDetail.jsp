<%-- 
    Document   : ProductDetail
    Created on : Jul 20, 2020, 8:22:27 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Coffee Time</title>
        <link href="styles1/style.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="styles1/base.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="styles/style2.css" rel="stylesheet" type="text/css" media="screen" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="style2/style.css">
        <link rel="stylesheet" href="style2/systemContact.css">
        <script type="text/javascript" src=" https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.js"></script>
        <!--<script type="text/javascript" src="scripts/jquery.pikachoose.js"></script>-->
        <script type="text/javascript">
            $(document).ready(function () {
                $("#pikame").PikaChoose();
            });
        </script>
    </head>
    <body>
        <div id="container">
            <header>
                <nav>
                    <ul id="nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="MenuController"class="current">Menu</a></li>
                        <li><a href="gallery.jsp">Gallery</a></li>
                        <li><a href="reviews.jsp" >Reviews</a></li>
                        <li><a href="LoadFBController">Contact</a></li>
                    </ul>
                </nav>
            </header>




            <article class="menu">

                    <c:forEach items="${Product}" var="i">

                        <div class="border3"></div>
                        <div class="left">
                            <h3>${i.getName()}
                        </div>
                        <div class="left star"><img src="images/star_full.png" class="noeffects" alt=""><img src="images/star_full.png" class="noeffects" alt=""><img src="images/star_full.png" class="noeffects" alt=""><img src="images/star_half_full.png" class="noeffects" alt=""><img src="images/star_empty.png" class="noeffects" alt=""></div>
                        <div class="right menu-order"><a class="button" onclick="addToCart({id: ${i.getId()}, name: '${i.getName()}',
                                    quantity: 1,
                                    price: ${i.getPrice()}})">$${i.getPrice()}</a></div>
                        <img src="${i.getImage()}" class="left clear item" width="150" alt="">
                        <p class="left">Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae.</p>
                    </c:forEach>
                </article>

                <article>
                    <h3>Reviews</h3>

                    <c:forEach items="${Reviews}" var="i">
                        <div class="border3"></div>
                        <blockquote>${i.getReview()}.<span>~${i.getName()}</span></blockquote>
                        <div class="border3"></div>
                    </c:forEach>
                </article>

                <footer>
                    <div class="border"></div>
                    <div class="footer-widget">
                        <h4>Derivation</h4>
                        <p>From the love for Vietnam and the passion for coffee, in 1999, the Coffee Time brand was born with the desire to enhance Vietnam's long-standing coffee heritage and spread the spirit of pride and the harmonious connection between transmission. system with modernity. </p>
                    </div>
                    <div class="footer-widget">
                        <h4>Enthusiastic staff team</h4>
                        <p>During the operation and development, the management team and staff of Coffee time, for generations, have built and cultivated a passion for tea and coffee with the desire to challenge the itself in the dynamic and innovative service industry.</p>
                    </div>
                    <div class="footer-widget">
                        <h4>We Are Social!</h4>
                        <div id="social"> <a href="#" class="s3d twitter" target="_blank"> Twitter <span class="icons twitter"></span> </a> <a href="#" class="s3d facebook" target="_blank"> Facebook <span class="icons facebook"></span> </a> <a href="#" class="s3d forrst" target="_blank"> Forrst <span class="icons forrst"></span> </a> <a href="#" class="s3d flickr" target="_blank"> Flickr <span class="icons flickr"></span> </a> <a href="#" class="s3d designmoo" target="_blank"> Designmoo <span class="icons designmoo"></span> </a> </div>
                    </div>
                    <div class="border2"></div>
                    <br />
                    <span class="copyright"><span class="left"><br />
                            &copy; Copyright 2012 - All Rights Reserved - <a href="#">Domain Name</a></span><span class="right"><br />
                            Design by <a href="http://www.priteshgupta.com">PriteshGupta.com</a><br />
                            <br>
                            <br />
                        </span></span></footer>
            </div>
        </div>
        <a id="cart" class="UNSHOW">
            <i class="fa fa-cart-plus" aria-hidden="true"></i>
            <i class="numberCart" id="totalNumberCart">0</i>
        </a>
        <div id="cartDetail" class="isShowCart UNSHOW">
            <a id="closeButton" class="close"><i class="fa fa-times-circle" aria-hidden="true"></i></a>
            <div class="cartBody">
                <h3>Cart's Information</h3>
                <div class="listProductSelected">
                    <table>
                        <thead>
                            <tr>
                                <th class="infoName">Product Name</th>
                                <th class="infoPrice">Price </th>
                                <th class="infoQuantity">Quantity</th>
                                <th class="acction"></th>
                            </tr>
                        </thead>
                        <tbody id="bodyTableListCart">

                        </tbody>
                    </table>
                </div>
                <div class="cartAction">
                    <div class="totalTitle">
                        <p>Total</p>
                    </div>
                    <div class="totalPrice">
                        <p><span id="TOTAL_PRICE">0</span> $</p>
                    </div>
                    <div class="totalQuantity">
                        <p><span id="TOTAL_QUANTITY">0</span> p</p>
                    </div>
                    <div class="totalAction">
                        <a href="CartDetail.jsp">Order</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="modal" class="UNSHOW"></div>
        <!-- <script src="./systemcontact.js" type="module"></script> -->

        <script src="js/index.js"></script>
        <!-- End shopping cart-->
        </body>
    </html>


