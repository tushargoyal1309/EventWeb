<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AwsWebApp1.Login" %>

<!DOCTYPE html>

<html>
<head>
    <title>Sonic Responsive Template</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
<!-- 
Sonic Template 
http://www.templatemo.com/preview/templatemo_394_sonic 
-->
	<meta charset="utf-8">
	<meta name="viewport" content="initial-scale=1">


    	<script src="scripts/js/jquery-1.10.2.min.js"></script>



	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="styles/bootstrap.min.css">
	<link rel="stylesheet" href="styles/font-awesome.min.css">
	<link rel="stylesheet" href="styles/templatemo_misc.css">
	<link rel="stylesheet" href="styles/templatemo_style.css">
    <link href="styles/style1.css" rel="stylesheet" />


   
       <link href="Content/formValidation.min.css" rel="stylesheet" />
        <script src="scripts/formValidation.min.js"></script>
    <script src="scripts/bootstrap.js"></script>

    <script src="scripts/bootstrap.min.js"></script>


    <script src="//oss.maxcdn.com/bootbox/4.2.0/bootbox.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
</head>
<body>

    <div  id="header" class="top-header" style="z-index: 3;position: fixed;">
        <span style="text-align:right; color:white; font-size:30px; vertical-align:middle;margin-top:10px">ISB</span>
        <p id="Eventmodel" class="pull-right"><a href="#" id="details" data-toggle="modal"  data-target="#myModal" style="color:white;float:right;font-size:20px;margin-right:30px">LogIn</a></p>
    </div>
	
	<!-- This one in here is responsive menu for tablet and mobiles -->
    <div class="responsive-navigation visible-sm visible-xs">
        <a href="#" class="menu-toggle-btn">
            <i class="fa fa-bars fa-2x"></i>
        </a>
        <div class="navigation responsive-menu">
            <ul>
                <li class="home"><a href="#templatemo">Home</a></li>
	            <li class="about"><a href="#about">About Us</a></li>

	            <li class="contact"><a href="#contact">Contact</a></li>
            </ul> <!-- /.main_menu -->
        </div> <!-- /.responsive_menu -->
    </div> <!-- /responsive_navigation -->

	<div id="main-sidebar" class="hidden-xs hidden-sm">
		<div class="logo">
			<a href="#"><h1>Evento</h1></a>
			<%--<span>Creative Portfolio Template</span>--%>
		</div> <!-- /.logo -->

		<div class="navigation">
	        <ul class="main-menu">
	            <li class="home"><a href="#templatemo">Home</a></li>
	            <li class="about"><a href="#about">About Us</a></li>

	            <li class="contact"><a href="#contact">Contact</a></li>
	        </ul>
		</div> <!-- /.navigation -->

	</div> <!-- /#main-sidebar -->

	<div id="main-content">

		<div id="templatemo">
			<div class="main-slider">
				<div class="flexslider">
					<ul class="slides">
                    
						<li>
							<div class="slider-caption">
								<h2>Responsive Layout</h2>
								<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames.</p>
								<a href="#" class="largeButton homeBgColor">Read More</a>
							</div>
							<img src="images/slide1.jpg" alt="Slide 1">
						</li>
                        
						<li>
							<div class="slider-caption">
								<h2>Portfolio Website</h2>
								<p>Fusce convallis enim vitae sagittis mollis. Sed bibendum ultricies dignissim.</p>
								<a href="#" class="largeButton homeBgColor">Details</a>
							</div>
							<img src="images/slide2.jpg" alt="Slide 2">
						</li>
                        
                        <li>
							<div class="slider-caption">
								<h2>Free Templates</h2>
								<p>All templates are free to download and use for your personal or commercial websites.</p>
								<a href="#" class="largeButton homeBgColor">Downloads</a>
							</div>
							<img src="images/slide3.jpg" alt="Slide 3">
						</li>
                        
					</ul>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="welcome-text">
							<h2>Welcome to Sonic Template</h2>
							<p>Sonic is <a href="#">free HTML5 template</a> provided by templatemo website for everyone. Credit goes to <a rel="nofollow" href="http://flexslider.woothemes.com">FlexSlider</a>. Maecenas adipiscing pellentesque elit eu volutpat. Integer vitae <a href="#">pulvinar magna</a>. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent auctor mi metus, nec sagittis purus ultrices id.</p>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- /#sTop -->

		<div class="container-fluid">

			<div id="about" class="section-content">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title">
							<h2>About Us</h2>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="member-item">
							<div class="member-thumb">
								<img src="images/team1.jpg" alt="girl 1">
								<div class="overlay">
									<ul class="social-member">
										<li><a href="#" class="fa fa-facebook"></a></li>
										<li><a href="#" class="fa fa-twitter"></a></li>
										<li><a href="#" class="fa fa-linkedin"></a></li>
									</ul>
								</div>
							</div>
							<div class="member-content">
								<h4>Christina Welldone</h4>
								<p>Marketing Director</p>
							</div>
						</div>
					</div> <!-- /.col-md-4 -->
					<div class="col-md-4">
						<div class="member-item">
							<div class="member-thumb">
								<img src="images/team2.jpg" alt="girl 2">
								<div class="overlay">
									<ul class="social-member">
										<li><a href="#" class="fa fa-facebook"></a></li>
										<li><a href="#" class="fa fa-twitter"></a></li>
										<li><a href="#" class="fa fa-linkedin"></a></li>
									</ul>
								</div>
							</div>
							<div class="member-content">
								<h4>Teri Belle</h4>
								<p>Creative Executive</p>
							</div>
						</div>
					</div> <!-- /.col-md-4 -->
					<div class="col-md-4">
						<div class="member-item">
							<div class="member-thumb">
								<img src="images/team3.jpg" alt="girl 3">
								<div class="overlay">
									<ul class="social-member">
										<li><a href="#" class="fa fa-facebook"></a></li>
										<li><a href="#" class="fa fa-twitter"></a></li>
										<li><a href="#" class="fa fa-linkedin"></a></li>
									</ul>
								</div>
							</div>
							<div class="member-content">
								<h4>Tawana Cherry</h4>
								<p>Company President</p>
							</div>
						</div>
					</div> <!-- /.col-md-4 -->
				</div> <!-- /.row -->
				<div class="row our-story">
					<div class="col-md-8">
						<h3>Our Management Team</h3>
					  	This is a mobile website template which can be viewed in mobile devices. Quisque in metus tristique, gravida dolor ut, varius neque. Maecenas ac risus aliquam, facilisis massa id, vulputate elit. Curabitur pretium arcu dictum, faucibus diam quis, commodo turpis. Proin viverra, risus eget egestas sodales, felis ante scelerisque ligula, eget condimentum diam ligula eu tellus. <br><br>
						Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde, exercitationem, laboriosam, modi non quisquam voluptas accusamus numquam ipsum reiciendis saepe veniam cupiditate explicabo autem. Repudiandae tempore dolore deserunt nemo voluptatum consectetur aspernatur expedita aliquid iste illo enim molestias vel animi quod.
					</div>
					<div class="col-md-4">
						<div class="story-image">
							<img src="images/responsive-design.jpg" alt="">
						</div>
					</div>
				</div> <!-- /.row -->
			</div> <!-- /#about -->
			


			<div id="contact" class="section-content">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title">
							<h2>Contact Us</h2>
						</div> <!-- /.section-title -->
					</div> <!-- /.col-md-12 -->
				</div> <!-- /.row -->
				<div class="row">
					<div class="col-md-12">
						<div class="map-holder">
							<div class="google-map-canvas" id="map-canvas">
                    		</div>
						</div> <!-- /.map-holder -->
					</div> <!-- /.col-md-12 -->
				</div> <!-- /.row -->
				<div class="row contact-form">
					<div class="col-md-4">
						<label for="name-id" class="required">Name:</label>
						<input name="name-id" type="text" id="name-id" maxlength="40">
					</div> <!-- /.col-md-4 -->
					<div class="col-md-4">
						<label for="email-id" class="required">Email:</label>
						<input name="email-id" type="text" id="email-id" maxlength="40">
					</div> <!-- /.col-md-4 -->
					<div class="col-md-4">
						<label for="subject-id">Subject:</label>
						<input name="subject-id" type="text" id="subject-id" maxlength="60">
					</div> <!-- /.col-md-4 -->
					<div class="col-md-12">
						<label for="message-id" class="required">Message:</label>
						<textarea name="message-id" id="message-id" rows="6"></textarea>
					</div> <!-- /.col-md-12 -->
					<div class="col-md-12">
						<div class="submit-btn">
							<a href="#" class="largeButton contactBgColor">Send Message</a>
						</div> <!-- /.submit-btn -->
					</div> <!-- /.col-md-12 -->
				</div>
			</div> <!-- /#contact -->



                <div class="app modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="overflow:hidden;margin-top:40px;margin-bottom:40px">

                   <div style="border-bottom: 1px solid #e5e5e5;"> <button style="margin-top: 21px;margin-right: 20px;" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div> 

	<div class="top-bar">
			<div class="navg">
				<span class="menu"> <img src="images/menu.png" alt=""/></span>
				<ul class="res">
					<li><a class="active scroll" href="#coffee">Menu</a></li>
					<li><a class="scroll" href="#about">Tools</a></li>
					<li><a class="scroll" href="#about">Settings</a></li>
					<li><a class="scroll" href="#contact">Login</a></li>
				</ul>
				<script>
				    $("span.menu").click(function () {
				        $("ul.res").slideToggle("slow", function () {
				            // Animation complete.
				        });
				    });
		       </script>
			</div>
		<h2>Welcome</h2>
	</div>
	<div class="cam-img">
		 <a href="#"><img src="images/cam.png" alt=""/></a> 
		 <input type="file" value="" />
	</div>
	<form id="loginForm" runat="server">
        <asp:TextBox ID ="txtusername" runat="server" placeHolder="Username" ></asp:TextBox>
		<%--<input type="text" value="Email address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email address';}"/>--%>
		<%--<input type="password" value="Password:"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password:';}"/>--%>
        <asp:TextBox ID ="txtpassword" runat="server" placeHolder="Password" TextMode="Password"></asp:TextBox>
		<%--<input type="submit" value="Authenticate" id="loginButton" />--%>
          <div class="">
      <asp:Button runat="server" Text="Authenticate" OnClick="newEvent_Click" type="button" ID="newEvent" class="btn btn-info"  CssClass="submit1"  UseSubmitBehavior="false" style=" background: #39DAF7;color: #FFF;font-size:20px;
    font-weight: 400;
    width: 60%;
    padding: 14px 15px;
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -o-border-radius: 5px;
    margin: 10px 0px 0px 0px;
    border: none;
    cursor: pointer;
    outline: none;" ></asp:Button>
</div>
	</form>
       <%-- <button class="btn btn-default" data-toggle="modal" data-target="#loginModal">Login</button>--%>
<%--		<input type="submit" value="Authenticate" id="loginButton" />--%>



    </div>

		</div> <!-- /.container-fluid -->

		<div class="site-footer">
			<div class="first-footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="social-footer">
								<ul>
									<li><a href="#" class="fa fa-facebook"></a></li>
									<li><a href="#" class="fa fa-twitter"></a></li>
									<li><a href="#" class="fa fa-dribbble"></a></li>
									<li><a href="#" class="fa fa-linkedin"></a></li>
									<li><a href="#" class="fa fa-rss"></a></li>
								</ul>
							</div> <!-- /.social-footer -->
						</div> <!-- /.col-md-12 -->
					</div> <!-- /.row -->
				</div> <!-- /.container-fluid -->
			</div> <!-- /.first-footer -->
			<div class="bottom-footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<p class="copyright">Copyright © 2084 <a href="#">Your Company Name</a>
                            </p>
						</div> <!-- /.col-md-6 -->
						<div class="col-md-6 credits">
							<p><!-- Design: <a href="http://www.templatemo.com">templatemo</a> --></p>
						</div> <!-- /.col-md-6 -->
					</div> <!-- /.row -->
				</div> <!-- /.container-fluid -->
			</div> <!-- /.bottom-footer -->
		</div> <!-- /.site-footer -->

	</div> <!-- /#main-content -->

	<!-- JavaScripts -->

    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
	<script src="scripts/js/jquery.singlePageNav.js"></script>
	<script src="scripts/js/jquery.flexslider.js"></script>
	<script src="scripts/js/jquery.prettyPhoto.js"></script>
	<script src="scripts/js/custom.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    
    <script src="scripts/bootbox.min.js"></script>
    <script src="scripts/formValidation.min.js"></script>

	<script>
	    $(document).ready(function () {
	      //  $("a[data-gal^='prettyPhoto']").prettyPhoto({ hook: 'data-gal' });


	        $("#details").click(function (e) {
	            var test = this.id;

	            var x = $(this).attr('name');

	          //  alert(x);
	            // alert($("#description1").text());
	            var lbltext = $('#description1');
	            $("#descriptionfull").html(x);

	        });


	        $("#loginButton").click(function (e) {
	            alert("test");
	        });








	        $('#loginForm').formValidation({
	            framework: 'bootstrap',
	            excluded: ':disabled',
	            icon: {
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields: {
	                username: {
	                    validators: {
	                        notEmpty: {
	                            message: 'The username is required'
	                        }
	                    }
	                },
	                password: {
	                    validators: {
	                        notEmpty: {
	                            message: 'The password is required'
	                        }
	                    }
	                }
	            }
	        });




	       // $('#loginButton').on('click', function () {
	        $("#loginButton").click(function (e) {
	            alert("test");
	            $("#loginForm")
                    .dialog({
                        title: 'Login',                       
                        message: $('#loginForm'),
                        show: false // We will show it manually later
                    })
                    .on('shown.bs.modal', function () {
                        $('#loginForm')
                            .show()                             // Show the login form
                            .formValidation('resetForm', true); // Reset form
                    })
                    .on('hide.bs.modal', function (e) {
                        // Bootbox will remove the modal (including the body which contains the login form)
                        // after hiding the modal
                        // Therefor, we need to backup the form
                        $('#loginForm').hide().appendTo('body');
                    })
                    .modal('show');
	        });
	

	    });

	    function initialize() {
	        var mapOptions = {
	            zoom: 13,
	            center: new google.maps.LatLng(40.7809919, -73.9665273)
	        };

	        var map = new google.maps.Map(document.getElementById('map-canvas'),
                mapOptions);
	    }

	    function loadScript() {
	        var script = document.createElement('script');
	        script.type = 'text/javascript';
	        script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' +
                'callback=initialize';
	        document.body.appendChild(script);
	    }

	    window.onload = loadScript;
    </script>
<!-- templatemo 394 sonic -->
</body>
</html>
