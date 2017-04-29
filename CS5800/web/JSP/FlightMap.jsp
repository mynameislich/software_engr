<%-- 
    Document   : FlightMap
    Created on : Apr 23, 2017, 1:28:19 PM
    Author     : colleengannon
--%>

<%@page import="java.util.ArrayList"%>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Wings Airline</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" type="text/css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" type="text/css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all">
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.js" ></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/cufon-yui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/cufon-replace.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_italic_600.font.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_italic_400.font.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/Myriad_Pro_400.font.js"></script>
        <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
        <!--[if lt IE 9]>
        <script type="text/javascript" src="js/ie6_script_other.js"></script>
        <script type="text/javascript" src="js/html5.js"></script>
        <![endif]-->
    </head>
    <body id="page5">
        <%-- header (template) --%>
        <div class="body1">
            <div class="main">
                <header>
                    <div class="wrapper">
                        <h1><a href="/CS5800/index" id="logo">AirLines</a><span id="slogan">Wings For You</span></h1>
                        <div class="right">
                            <nav>
                                <ul id="menu">
                                    <li><a href="/CS5800/index">Home</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <%--<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
                    <script>
                        var map;
                        function initialize() {
                          var mapOptions = {
                            zoom: 8,
                            center: new google.maps.LatLng(-34.397, 150.644)
                          };
                          map = new google.maps.Map(document.getElementById('map-canvas'),
                              mapOptions);
                        }

                        google.maps.event.addDomListener(window, 'load', initialize);
                    </script>
                    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCLVGVM7pveu7XbpVZ1bNAkwp1XMCmEJa4&callback=initMap"
                    async defer></script>--%>
                </header>
            </div>
        </div>

        
        <%-- main page content --%>
         <body>
    <div id="floating-panel">
      <input id="address" type="hidden" value="iowa city">
      
    </div>
         <center><div id="map" style="width: 800px; height: 600px; margin: auto 0"></div></center>
    <script>
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8,
          center: {lat: -34.397, lng: 150.644}
        });
        var geocoder = new google.maps.Geocoder();

        
          geocodeAddress(geocoder, map);
        
      }

      function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('address').value;
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCLVGVM7pveu7XbpVZ1bNAkwp1XMCmEJa4&callback=initMap"
                    async defer>
  </body>
        
        <%-- footer (template) --%>
        <div class="body2">
            <div class="main">
                <footer>
                    <div class="footerlink">
                        <p class="lf">Copyright &copy; 2010  - All Rights Reserved</p>
                        <p class="rf">Template from<a href="http://www.templatemonster.com/">TemplateMonster</a></p>
                        <div style="clear:both;"></div>
                    </div>
                </footer>
            </div>
        </div>
        <script type="text/javascript"> Cufon.now();</script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script type="text/javascript">

            (function () {

                var bodyEl = $('body'),
                        navToggleBtn = bodyEl.find('.nav-toggle-btn');

                navToggleBtn.on('click', function (e) {
                    bodyEl.toggleClass('active-nav');
                    e.preventDefault();
                });
            })();
        </script>
        <!-- END PAGE SOURCE -->
    </body>
</html>
