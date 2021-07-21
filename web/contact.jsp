<%-- 
    Document   : contact
    Created on : Jul 16, 2020, 9:20:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Coffee Time</title>
        <link href="styles/radio.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="styles/style.css" rel="stylesheet" type="text/css" media="screen" />

        <link rel="shortcut icon" href="assets/images/logo.jpg" type="image/x-icon">
    </head>
    <body>
        <div id="container">
            <header>
                <nav>
                    <ul id="nav">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="MenuController">Menu</a></li>
                        <li><a href="gallery.jsp">Gallery</a></li>
                        <li><a href="reviews.jsp">Reviews</a></li>
                        <li><a href="LoadFBController" class="current">Contact</a></li>
                    </ul>
                </nav>
            </header>
            <div class="wrapper">
                <div class="border"></div>
                <article>
                    <h3>Contact Us</h3>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.482205851075!2d105.52509761472442!3d21.01338329367941!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454b32ca5086d%3A0xa3c62e29d8ab37e4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1595123228083!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                    <br />
                    <p>Come with us to enjoy the great taste with friends and relatives.</p>
                    <form action="FeedbackController" method="get">
                        <label for="name">Name:</label>
                        <br>
                        <input type="text" name="name" id="name" value="" tabindex="1" required=""/>
                        <br>
                        <br>
                        <label for="name">Subject:</label>

                        <div class="container1">
                            <c:forEach items="${product}" var="i">
                                <ul id="ul1">
                                    <li id="li1">
                                        <input type="radio" id="${i.getId()}" name="subject" value="${i.getName()}">
                                        <label for="${i.getId()}">${i.getName()}</label>
                                        <div class="check"></div>
                                    </li>
                                </ul>
                            </c:forEach>

                        </div>

                        <br>
                        <br>
                        <label for="name">Phone:</label>
                        <br>
                        <input type="text" name="phone" id="email" value="" tabindex="1" required="" />
                        <br>
                        <br>
                        <label for="textarea">Message:</label>
                        <br>
                        <textarea cols="40" rows="8" id="textarea" name="message" required=""></textarea>
                        <br>
                        <br>
                        <input type="submit" name="submitFB" value="Submit" class="button" />
                    </form>
                    <br>
                    <%
                        if (request.getAttribute("result") != null) {
                            out.print(request.getAttribute("result"));
                        } else {
                            out.print("");
                        }
                    %>
                    <br>
                    <br>
                    <br>
                </article>
                <aside class="sidebar">
                    <h3>From The Blog</h3>
                    <ul class="blog">
                        <li><a href="#">Lorem Ipsum Dolor</a><br/>
                            Orciint erdum condimen terdum nulla mcorper elit nam curabitur... </li>
                        <li><a href="#">Praesent Et Eros</a><br/>
                            Orciint erdum condimen terdum nulla mcorper elit nam curabitur... </li>
                        <li><a href="#">Suspendisse In Neque</a><br/>
                            Orciint erdum condimen terdum nulla mcorper elit nam curabitur... </li>
                        <li><a href="#">Suspendisse In Neque</a><br/>
                            Orciint erdum condimen terdum nulla mcorper elit nam curabitur... </li>
                    </ul>
                    <div class="border3"></div>
                    <h3>Sidebar Widget</h3>
                    <img src="images/home/1.jpg" width="280" alt="" />
                    <p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. In turpis pulvinar facilisis. Ut felis.<br>
                        <a href="" class="right" style="padding-top:7px"><strong>Continue Reading &raquo;</strong></a></p>
                </aside>
                <div class="border2"></div>
                <br>
            </div>
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
    </body>
</html>