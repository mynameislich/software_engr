<%-- 
    Document   : Reservation
    Created on : Apr 16, 2017, 4:41:53 PM
    Author     : Emily
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wings Airline</title>
                <meta charset="utf-8">
        <meta charset="utf-8">
        <link rel="stylesheet" href="../css/reset.css" type="text/css" media="all">
        <link rel="stylesheet" href="../css/layout.css" type="text/css" media="all">
        <link rel="stylesheet" href="../css/style.css" type="text/css" media="all">
        <script type="text/javascript" src="../js/jquery-1.4.2.js" ></script>
        <script type="text/javascript" src="../js/cufon-yui.js"></script>
        <script type="text/javascript" src="../js/cufon-replace.js"></script>
        <script type="text/javascript" src="../js/Myriad_Pro_italic_600.font.js"></script>
        <script type="text/javascript" src="../js/Myriad_Pro_italic_400.font.js"></script>
        <script type="text/javascript" src="../js/Myriad_Pro_400.font.js"></script>
    </head>
    <body id = "page 8">
        <div class="body1">
        <div class="main">
          <header>
            <div class="wrapper">
              <h1><a href="/CS5800/index" id="logo">AirLines</a><span id="slogan">Wings For You</span></h1>
              <div class="right">
                <nav>
                  <ul id="menu">
                    <li><a href="/CS5800/index">Add Airplane</a></li>
                  </ul>
                </nav>
              </div>
            </div>
          </header>
        </div>
        </div>

       <div class="main">
    <section id="content">
      <article class="col2 pad_left1">
          <h2>Customer Reservation </h2> <!-- Stopped here -->

        <form id="ReservationForm" name="myForm" action="/CS5800/Reservation" method="post">
          <div>
            <div class="wrapper">
              <div class="bg">
                <input type="text" name="month" class="input" required>
              </div>
              *Month:<br /> <!--display on screen = *Variable-->
            </div>
            <div class="wrapper">
              <div class="bg">
                <input type="text" name="day" class="input" required>
              </div>
              *Day:<br />
            </div>
            <div class="wrapper">
              <div class="bg">
                <input type="text" name="year" class="input" required>
              </div>
              *Year:<br />
            </div>
              <div class="wrapper">
              <div class="bg">
                <output type="text" name="cost" class="output" required>
              </div>
              *Cost:<br />
            </div>
              <div class="wrapper">
              <div class="bg">
                <select name="gender"  class="input" required>
                            <option value="Economic Class">Economic</option>
                            <option value="Business Class">Business</option>
                            <option value="First Class">First</option>
                        </select><br>

                <input type="text" name="flightClass" class="input" required>
              </div>
              *Class Type:<br />
            </div>
              
            <input type="submit" value="Submit" class="button1">

        </form>

      </article>
    </section>
        
    </body>
</html>
