<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Site Metas -->
    <title>تسجيل حالة مشتبه بها</title>
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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
        $(document).ready(function() {
$('.mdb-select').materialSelect();
});
    </script>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<%@page import="entity.*" %>
<%@page import="api.*" %>
<%@page import="java.util.*" %>

<%
        /*
        check for login
        */
        Object o=session.getAttribute(User.IS_LOGIN);
        if(o!=null){
            response.sendRedirect("index.jsp");
        }
        List<Infection> infections=InfectionApi.get_all();
        List<Symptom> symptoms=SymptomApi.get_all();
        List<Governorate>governorates=GovernorateApi.get_all();
        
        String sick_name=request.getParameter("name");
        String address=request.getParameter("address");
        String phone=request.getParameter("phone");
        String mobile=request.getParameter("mobile");
        String governorate_id=request.getParameter("governorate_id");
        String identity_number=request.getParameter("identity_number");
        String nationality_number=request.getParameter("nationality_number");
        String mail=request.getParameter("mail");
        
        String infection=request.getParameter("infection");
        
        String symptom1=request.getParameter("symptom1");
        String symptom2=request.getParameter("symptom2");
        String symptom3=request.getParameter("symptom3");
        String symptom4=request.getParameter("symptom4");

        if(sick_name !=null && address!=null && phone!=null && mobile!=null && identity_number!=null && nationality_number!=null && mail!=null){
            response.sendRedirect("index.jsp");
            Sick sick=new Sick(sick_name, address, Integer.parseInt(phone), Integer.parseInt(mobile),  Integer.parseInt(governorate_id), 1, Integer.parseInt(nationality_number), Integer.parseInt(identity_number), mail);
            int sick_id=SickApi.add(sick);
            
            SickInfectionApi.add(new SickInfection(0, sick_id, Integer.parseInt(infection)));
            
            if(symptom1!=null)
                SickSymptomApi.add(new SickSymptom(0, sick_id, Integer.parseInt(symptom1)));
            if(symptom2!=null)
                SickSymptomApi.add(new SickSymptom(0, sick_id, Integer.parseInt(symptom2)));
            if(symptom3!=null)
                SickSymptomApi.add(new SickSymptom(0, sick_id, Integer.parseInt(symptom3)));
            if(symptom4!=null)
                SickSymptomApi.add(new SickSymptom(0, sick_id, Integer.parseInt(symptom4)));

        }else{
            
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
                            <li><a class="join_bt" href="Login.jsp">Login</a></li>
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
                    <ul class="navbar-nav">
                        <li><a class="nav-link active" href="index.jsp"></a></li>
                        <li><a class="nav-link" href="About.jsp">حول الموقع</a></li>
                        <li><a class="nav-link" href="HealthCenters.jsp">المراكز الصحية</a></li>
                        <li><a class="nav-link" href="QuarantineCenters.jsp">مراكز الحجر الصحي</a></li>
                        <li><a class="nav-link" href="RegisterSick.jsp">تسجيل حالة</a></li>
                        <li><a class="nav-link" href="Injuries.jsp">الإصابات</a></li>
                    </ul>
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
    <div class="section inner_page_banner">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="banner_title">
                        <h3>تسجيل حالة مشتبه بها</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Banner -->
     
   <!-- section -->
    <div class="section layout_padding">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="full">
                        <div class="heading_main text_align_center">
                           <h2><span class="theme_color"></span>المعلومات الأساسية</h2>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- end section -->
    <form method="get" action="">
    <!-- contact_form -->
    <div class="section contact_form">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-12 offset-lg-3">
                    <div class="full">
                        <div class="contact_form_inner" action="post">
                            <fieldset>
                                <div class="field">
                                    <input type="text" name="name" placeholder="Your name" />
                                </div>
                                <div class="field">
                                    <input type="text" name="address" placeholder="Address" />
                                </div>
                                
                                <div class="form-group">
                                    <select id="lunch" name="governorate_id" class="mdb-select md-form colorful-select dropdown-primary" style="width: 100%">
                                            <% for(Governorate g:governorates){%>
                                            <option value="<%=g.governorate_id %>"><%= g.governorate_name %></option>
                                            <% } %>
                                        </select>
                                        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/js/bootstrap-select.min.js"></script>
                                        <script>
                                            //$('.mdb-select').selectpicker();
                                           // $('.mdb-select').materialSelect();
                                            </script>   
                                    </div>
                                    
                             
                                <div class="field">
                                    <input type="number" name="phone" placeholder="Your Phone Number" />
                                </div>
                                <div class="field">
                                    <input type="number" name="mobile" placeholder="Your Mobile Number" />
                                </div>
                                 <div class="field">
                                    <input type="number" name="nationality_number" placeholder="Nationality Number" />
                                </div>
                                 <div class="field">
                                    <input type="number" name="identity_number" placeholder="Identity Number" />
                                </div>
                                <div class="field">
                                    <input type="email" name="mail" placeholder="Email" />
                                </div>
                            
                              
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                                 
    <!-- end contact_form -->
   <div class="section layout_padding_register">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="full">
                        <div class="heading_main text_align_center">
                           <h2><span class="theme_color"></span>الأعراض التي تشعر بها </h2>    
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="full services_blog form-control">
                      <input type="checkbox" name="symptom1" value="1">
                      <label for="symptom1"> <%= symptoms.get(0).symptom_name %></label>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="full services_blog form-control">
                      <input type="checkbox" name="symptom2" value="2">
  <label for="symptom2">  <%= symptoms.get(1).symptom_name %></label>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="full services_blog form-control">
                      <input type="checkbox" name="symptom3" value="3">
  <label for="symptom3">  <%= symptoms.get(2).symptom_name %></label>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="full services_blog form-control">
                      <input type="checkbox" name="symptom4" value="4">
  <label for="symptom4">  <%= symptoms.get(3).symptom_name %></label>
                    </div>
                </div>
            </div>
         
        </div>
    </div>
    
      <!-- end contact_form -->
   <div class="section layout_padding_register">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="full">
                        <div class="heading_main text_align_center">
                           <h2><span class="theme_color"></span>طريقة العدوى </h2>    
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="full services_blog text_align_center form-control">
                        <input type="radio" name="infection" value="1" class="form-check-input" checked="true">
                      <label for="1" class="form-check-label"> <%= infections.get(0).infection_name %></label>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="full services_blog text_align_center form-control">
                        <input type="radio" class="form-check-input" name="infection" value="2">
                      <label for="2" class="form-check-label">  <%= infections.get(1).infection_name %></label>
                    </div>
                </div>
                
                
            </div>
         
        </div>
    </div>
                    
       <div class="section contact_form_botton">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-12 offset-lg-3">
                    <div class="full">
                        <div class="contact_form_inner" action="get">
                            <fieldset>
                             <div class="field center">
                                    <button>حفظ</button>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>   
                    
    <!-- Start Footer -->
    </form>
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
