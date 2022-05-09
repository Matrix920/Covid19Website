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
    <title>تعديل حالة المريض</title>
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
    
     <link rel="stylesheet" href="css/my_style.css" />
    
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
        if(o==null){
            response.sendRedirect("index.jsp");
        }
        
        Sick sick=new Sick();
        String s_sick_id=request.getParameter(Sick.SICK_ID);
        if(s_sick_id!=null){
            sick=SickApi.get(Integer.parseInt(s_sick_id));
        }
                  
        String state_id=request.getParameter(State.STATE_ID);

        if(state_id!=null){
            int sick_id=Integer.parseInt(s_sick_id);
            SickApi.update_state(sick_id,Integer.parseInt(state_id));
            response.sendRedirect("ManageInjuries.jsp");
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
                            <li><a class="join_bt" href="Logout.jsp">Logout</a></li>
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
                        <li><a class="nav-link" href="ManageHealthCenters.jsp">المراكز الصحية</a></li>
                        <li><a class="nav-link" href="ManageQuarantineCenters.jsp">مراكز الحجر الصحي</a></li>
                        <li><a class="nav-link" href="ManageRequests.jsp">طلبات المواطنين</a></li>
                        <li><a class="nav-link" href="ManageInjuries.jsp">الحالات المصابة</a></li>
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
                        <h3>تعديل حالة المريض</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Banner -->
     
     <div class="section layout_padding_register">
        <div class="container-fluid">
           
            <div class="row">
                <div class="col-md-12 col-sm-6 col-xs-12">
                    <div class="full services_blog">
                        <form action="" method="post">
                     <table id="customers">
  <tr>
    <th>الرقم</th>
    <th>الاسم</th>
    <th>المحافظة</th>
    <th>الأعراض</th>
    <th>العدوى</th>
    <th>المركز الصحي</th>
    <th>الحالة</th>
    <th></th>
  </tr>

  <tr>
      <td><%=sick.sick_id%></td>
      <td> <%=sick.sick_name%> </td>
      <td><%=sick.governorate.governorate_name%></td>
      <td>  
          <% List<SickSymptom> symptoms=sick.symptoms;
          for(SickSymptom ss:symptoms){%>
              
                      <%= SymptomApi.get(ss.symptom_id).symptom_name %> - 
                
         <% }
          %>
               </td>
      <td> <%= InfectionApi.get(sick.infection.infection_id).infection_name %></td>
      <td>  <%=  HealthCenterApi.get(sick.sickHealthCenter.health_center_id).health_center_name %> </td>
      <td><select name="state_id">
              <% List<State> states=StateApi.get_all_sicks();
              for(State s:states){
                  %>
                  <option value="<%= s.state_id %>" <%= s.state_id==sick.state_id?"selected":""%> ><%= s.state_name %></option>
                  <%
              }%>
          </select></td>
          <td> <button class="btn">حفظ التغييرات</button></td>
  </tr>

</table>
                        </form>
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