<%-- 
    Document   : gallery
    Created on : Jul 16, 2020, 9:21:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Coffee Time</title>
	<link href="styles/style.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="styles/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" media="screen" />
        <link rel="shortcut icon" href="assets/images/logo.jpg" type="image/x-icon">
	<script type="text/javascript" src=" https://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.js"></script>
	<script type="text/javascript" src="scripts/jquery.fancybox-1.3.4.pack.js"></script>
	<script type="text/javascript">
				$(document).ready(function() {
				$("a.fancyimage").fancybox({
				'overlayShow'	: false,
				'transitionIn'	: 'elastic',
				'transitionOut'	: 'elastic'	});
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
            <li><a href="MenuController">Menu</a></li>
            <li><a href="gallery.jsp" class="current">Gallery</a></li>
            <li><a href="reviews.jsp">Reviews</a></li>
            <li><a href="LoadFBController">Contact</a></li>
          </ul>
        </nav>
      </header>
      <div class="wrapper">
        <div class="border"></div>
        <article class="fullwidth gallery">
          <h3>Gallery</h3>
          <a class="fancyimage" href="images/gallery/1.jpeg"><img src="images/gallery/1.jpeg" width="200" height="200" alt="" /></a> <a class="fancyimage" href="images/gallery/2.jpg"><img src="images/gallery/2.jpg" width="200" height="200" alt="" /></a> <a class="fancyimage" href="images/gallery/3.jpeg"><img src="images/gallery/3.jpeg" width="200" height="200" alt="" /></a> <a class="fancyimage" href="images/gallery/4.jpg"><img src="images/gallery/4.jpg" width="200" height="200" alt="" /></a> <a class="fancyimage" href="images/gallery/5.jpeg"><img src="images/gallery/5.jpeg" width="200" height="200" alt="" /></a> <a class="fancyimage" href="images/gallery/6.jpg"><img src="images/gallery/6.jpg" width="200" height="200" alt="" /></a> <a class="fancyimage" href="images/gallery/7.jpeg"><img src="images/gallery/7.jpeg" width="200" height="200" alt="" /></a> <a class="fancyimage" href="images/gallery/8.jpg"><img src="images/gallery/8.jpg" width="200" height="200" alt="" /></a> </article>
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

