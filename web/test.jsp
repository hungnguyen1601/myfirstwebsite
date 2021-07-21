<%-- 
    Document   : test
    Created on : Nov 16, 2020, 9:23:38 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
// Load google 
            chartsgoogle.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);
// Draw the chart and set the chart 
            valuesfunction drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['Work', 8],
                    ['Friends', 2],
                    ['Eat', 2],
                    ['TV', 3],
                    ['Gym', 2],
                    ['Sleep', 7]
                ]);
                // Optional; add a title and set the width and height of the chart  
                var options = {'title': 'My Average Day', 'width': 400, 'height': 300};
                // Display the chart inside the <div> element with id="piechart"  
                var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                chart.draw(data, options);
            }</script>
    </head>
    <body>
        <h1>My Web Page</h1>



        <div id="piechart"></div>
    </body>
</html>
