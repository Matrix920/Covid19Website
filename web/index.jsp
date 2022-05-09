<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Site Metas -->
    <title>الصفحة الرئيسية</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="#" type="image/x-icon" />
    <link rel="apple-touch-icon" href="#" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- Pogo Slider CSS -->
    <link rel="stylesheet" href="css/pogo-slider.min.css" />
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css" />

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<%@page import="entity.User" %>
<%@page import="api.UserApi" %>
<%
        /*
        check for login
        */
        User user=new User();
        Object o=session.getAttribute(User.IS_LOGIN);
        if(o!=null){
            user.is_login=true;
        }
        %>
<body id="home" data-spy="scroll" data-target="#navbar-wd" data-offset="98">

    <!-- LOADER -->
    <div id="preloader">
        <div class="loader">
            <img src="images/loader.gif" alt="#" />
        </div>
    </div>
    <!-- end loader -->
    <!-- END LOADER -->

    <!-- Start header -->
    <header class="top-header">
        <div class="header_top">
            
            <div class="container">
                <div class="row">
                    <div class="logo_section">
                        <a class="navbar-brand" href="index.jsp"><img src="images/covidlogo.png" alt="image"></a>
                    </div>
                    <div class="site_information">
                        <ul>
                            <li><a href=""><img src="images/mail_icon.png" alt="#"/></a></li>
                            <li><a href=""><img src="images/phone_icon.png" alt="#" /></a></li>
                            <%if(!user.is_login){%>
                            <li><a class="join_bt" href="Login.jsp">Login</a></li>
                            <% } else {%>
                            <li><a class="join_bt" href="Logout.jsp">Logout</a></li>
                            <% } %>
                        </ul>
                    </div>
                </div>
            </div>
        
        </div>
        <div class="header_bottom">
          <div class="container">
            <div class="col-sm-12">
                <div class="menu_orange_section" style="background: #ff880e;">
                   <nav class="navbar header-nav navbar-expand-lg"> 
                     <div class="menu_section">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-wd" aria-controls="navbar-wd" aria-expanded="false" aria-label="Toggle navigation">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbar-wd">
                    <!-- Client-->
                     <%if(!user.is_login){%>
                    <ul class="navbar-nav">
                        <li><a class="nav-link active" href="index.jsp"></a></li>
                        <li><a class="nav-link" href="About.jsp">حول الموقع</a></li>
                        <li><a class="nav-link" href="HealthCenters.jsp">المراكز الصحية</a></li>
                        <li><a class="nav-link" href="QuarantineCenters.jsp">مراكز الحجر الصحي</a></li>
                        <li><a class="nav-link" href="RegisterSick.jsp">تسجيل حالة</a></li>
                        <li><a class="nav-link" href="Injuries.jsp">الإصابات</a></li>
                    </ul>
                     <% } else {%>
                    <!-- end client-->
                    
                    <!-- Admin-->
                    <ul class="navbar-nav">
                        <li><a class="nav-link active" href="index.jsp"></a></li>
                        <li><a class="nav-link" href="ManageHealthCenters.jsp">المراكز الصحية</a></li>
                        <li><a class="nav-link" href="ManageQuarantineCenters.jsp">مراكز الحجر الصحي</a></li>
                        <li><a class="nav-link" href="ManageRequests.jsp">طلبات المواطنين</a></li>
                        <li><a class="nav-link" href="ManageInjuries.jsp">الحالات المصابة</a></li>
                    </ul>
                    <!-- end admin-->
                    <% } %>
                </div>
                     </div>
                 </nav>
                 
                </div>
            </div>
          </div>
        </div>
        
    </header>
    <!-- End header -->

    <!-- Start Banner -->
    <div class="ulockd-home-slider">
        <div class="container-fluid">
            <div class="row">
                <div class="pogoSlider" id="js-main-slider">
                    <div class="pogoSlider-slide" style="background-image:url(images/infection1.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="slide_text white_fonts">
                                        <h3><br><strong></strong></h3>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pogoSlider-slide" style="background-image:url(images/infection2.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="slide_text white_fonts">
                                        <h3><br><strong></strong></h3>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!--matrix-->
                     <div class="pogoSlider-slide" style="background-image:url(images/infection3.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="slide_text white_fonts">
                                        <h3><br><strong></strong></h3>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                     <div class="pogoSlider-slide" style="background-image:url(images/infection4.jpg);">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="slide_text white_fonts">
                                        <h3><br><strong></strong></h3>
                                        <br>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                </div>
                <!-- .pogoSlider -->
            </div>
        </div>
    </div>
    <!-- End Banner -->
    
	<!-- section -->

	<!-- end section -->
    <!-- section -->
    <div class="section layout_padding">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="full">
                        <div class="heading_main text_align_center">
                           <h2><span class="theme_color"></span>الوقاية من فيروس كورونا</h2>    
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="full services_blog">
                       <img class="img-responsive" src="images/avoid1.jpg" alt="#" />
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="full services_blog">
                        <img class="img-responsive" src="images/avoid2.jpg" alt="#" />
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="full services_blog">
                        <img class="img-responsive" src="images/avoid3.jpg" alt="#" />
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="full services_blog">
                        <img class="img-responsive" src="images/avoid4.jpg" alt="#" />
                    </div>
                </div>
            </div>
         
        </div>
    </div>
    <!-- end section -->
    <!-- section -->
    
    <!-- end section -->
	<!-- section -->
   
    <!-- end section -->
	<!-- section -->
    
    <!-- end section -->
    <!-- section -->
   
    <!-- end contact_form -->
    <!-- end section -->
    <!-- Start Footer -->
    <footer class="footer-box">
        <div class="container">
            <div class="row">
               <div class="col-md-12 white_fonts">
                    <div class="row">
                       
                      
                  
					</div>
                </div>
			 </div>
        </div>
    </footer>
    <!-- End Footer -->

    <div class="footer_bottom">
        <div class="container">
            <div class="row">
                <div class="col-12">
                </div>
            </div>
        </div>
    </div>

    <a href="#" id="scroll-to-top" class="hvr-radial-out"><i class="fa fa-angle-up"></i></a>

    <!-- ALL JS FILES -->
    <script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.pogo-slider.min.js"></script>
    <script src="js/slider-index.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/custom.js"></script>
	<script>
	/* counter js */

(function ($) {
	$.fn.countTo = function (options) {
		options = options || {};
		
		return $(this).each(function () {
			// set options for current element
			var settings = $.extend({}, $.fn.countTo.defaults, {
				from:            $(this).data('from'),
				to:              $(this).data('to'),
				speed:           $(this).data('speed'),
				refreshInterval: $(this).data('refresh-interval'),
				decimals:        $(this).data('decimals')
			}, options);
			
			// how many times to update the value, and how much to increment the value on each update
			var loops = Math.ceil(settings.speed / settings.refreshInterval),
				increment = (settings.to - settings.from) / loops;
			
			// references & variables that will change with each update
			var self = this,
				$self = $(this),
				loopCount = 0,
				value = settings.from,
				data = $self.data('countTo') || {};
			
			$self.data('countTo', data);
			
			// if an existing interval can be found, clear it first
			if (data.interval) {
				clearInterval(data.interval);
			}
			data.interval = setInterval(updateTimer, settings.refreshInterval);
			
			// initialize the element with the starting value
			render(value);
			
			function updateTimer() {
				value += increment;
				loopCount++;
				
				render(value);
				
				if (typeof(settings.onUpdate) == 'function') {
					settings.onUpdate.call(self, value);
				}
				
				if (loopCount >= loops) {
					// remove the interval
					$self.removeData('countTo');
					clearInterval(data.interval);
					value = settings.to;
					
					if (typeof(settings.onComplete) == 'function') {
						settings.onComplete.call(self, value);
					}
				}
			}
			
			function render(value) {
				var formattedValue = settings.formatter.call(self, value, settings);
				$self.html(formattedValue);
			}
		});
	};
	
	$.fn.countTo.defaults = {
		from: 0,               // the number the element should start at
		to: 0,                 // the number the element should end at
		speed: 1000,           // how long it should take to count between the target numbers
		refreshInterval: 100,  // how often the element should be updated
		decimals: 0,           // the number of decimal places to show
		formatter: formatter,  // handler for formatting the value before rendering
		onUpdate: null,        // callback method for every time the element is updated
		onComplete: null       // callback method for when the element finishes updating
	};
	
	function formatter(value, settings) {
		return value.toFixed(settings.decimals);
	}
}(jQuery));

jQuery(function ($) {
  // custom formatting example
  $('.count-number').data('countToOptions', {
	formatter: function (value, options) {
	  return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
	}
  });
  
  // start all the timers
  $('.timer').each(count);  
  
  function count(options) {
	var $this = $(this);
	options = $.extend({}, options || {}, $this.data('countToOptions') || {});
	$this.countTo(options);
  }
});
	</script>
</body>

</html>