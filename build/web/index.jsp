<%-- 
    Document   : index
    Created on : Jul 16, 2020, 9:19:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            
            <jsp:include page="Header.jsp"></jsp:include>

            <!-- begin shopping cart-->



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




            <div class="wrapper">
                <div class="pikachoose">
                    <ul id="pikame">
                        <li><a href=""><img src="images/home/1.jpg" alt="" class="resize"/></a></li>
                        <li><a href=""><img src="images/home/2.jpg" alt="" class="resize"/></a></li>
                        <li><a href=""><img src="images/home/3.jpg" alt="" class="resize"/></a></li>
                        <li><a href=""><img src="images/home/4.jpg" alt="" class="resize"/></a></li>
                    </ul>
                </div>
                <div class="clear"></div>
                <div class="border"></div>
                <div class="home-widget">
                    <h3>Cappuccino</h3>
                    <img src="images/home/5.jpg" width="300" alt="" />
                    <p>Trendy coffee cup of milk! A bit more bold than Latte, our Cappuccino starts with espresso, then adds an equal amount of fresh milk and foam to make it appealing. You can choose between hot drinks or ice.</p>
                </div>
                <div class="home-widget">
                    <h3>Ice milk phin</h3>
                    <img src="images/home/6.jpg" width="300" alt="" />
                    <p>The taste of authentic Vietnamese coffee! Each scrumptious coffee bean is hand-selected, a unique blend of Robusta beans from the Vietnamese plateau, adding aromatic Arabica. Coffee is made from traditional Phin, mixed with condensed milk and added with a bit of ice to create a glass of Ice Phin.</p>
                </div>
                <div class="home-widget">
                    <h3>Tea cheese cake</h3>
                    <img src="images/home/7.jpg" width="300" alt="" />
                    <p>A refreshing creation, combining rich green tea and low-fat cheese.</p>
                </div>
                <div class="border2"></div>
                <br />
                <aside id="pricing-table" class="clear">
                    <div class="plan">
                        <h3>Morning<span>$15</span></h3>
                        <a class="button" href="" onclick="addListToCart([
                    {
                        id: '5',
                        name: 'Shredded chicken bread',
                        quantity: 1,
                        price: 10},
                    {
                        id: '1',
                        name: 'Cappuccino',
                        quantity: 1,
                        price: 10}
                ]
                        )">Order Now</a>
                        <ul>
                            <li><strong style="text-transform:uppercase">Shredded Chicken Bread</strong></li>
                            <li><strong style="text-transform:uppercase">Cappuccino</strong></li>
                        </ul>
                    </div>
                    <div class="plan">
                        <h3>Midday<span>$10</span></h3>
                        <a class="button" href="" onclick="addListToCart([
                                    {
                                        id: '7',
                                        name: 'Tiramisu cake',
                                        quantity: 1,
                                        price: 5},
                                    {
                                        id: '2',
                                        name: 'PHIN Coffee and Condensed Milk',
                                        quantity: 1,
                                        price: 10}
                                ]
                                        )">Order Now</a>
                        <ul>
                            <li><strong style="text-transform:uppercase">Tiramisu Cake</strong></li>
                            <li><strong style="text-transform:uppercase">PHIN Coffee & Condensed Milk</strong></li>
                        </ul>
                    </div>
                    <div class="plan">
                        <h3>Evening<span>$10</span></h3>
                        <a class="button" href="" onclick="addListToCart([
                                    {
                                        id: '8',
                                        name: 'Banana cake',
                                        quantity: 1,
                                        price: 5},
                                    {
                                        id: '9',
                                        name: 'Lime ice blended',
                                        quantity: 1,
                                        price: 8}
                                ]
                                        )">Order Now</a>
                        <ul>
                            <li><strong style="text-transform:uppercase">Banana Cake</strong></li>
                            <li><strong style="text-transform:uppercase">Lime Ice Blended</strong></li>
                        </ul>
                    </div>
                </aside>
            </div>
            
            <jsp:include page="Footer.jsp"></jsp:include>
            
        </div>
    </body>
</html>
