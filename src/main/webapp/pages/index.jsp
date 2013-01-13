<?xml version="1.0" encoding="UTF-8"?>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Botteghino degli Eventi</title>

<sj:head loadFromGoogle="true" />

<link rel="stylesheet" type="text/css" href="/css/demo.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link href='http://fonts.googleapis.com/css?family=Kelly+Slab' rel='stylesheet' type='text/css' />
<!--[if lt IE 9]>
		<link rel="stylesheet" type="text/css" href="css/styleIE.css" />
	<![endif]-->
<script type="text/javascript" src="/js/modernizr.custom.11333.js" />

<!-- FANCYBOX CODE -->
	<!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="/js/jquery.mousewheel-3.0.6.pack.js" />

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="/fancybox/jquery.fancybox.js?v=2.1.3" />
	<link rel="stylesheet" type="text/css" href="/fancybox/jquery.fancybox.css?v=2.1.2" media="screen" />

	<!-- Add Button helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="/fancybox/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="/fancybox/helpers/jquery.fancybox-buttons.js?v=1.0.5" />

	<!-- Add Thumbnail helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="/fancybox/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
	<script type="text/javascript" src="/fancybox/helpers/jquery.fancybox-thumbs.js?v=1.0.7" />

	<!-- Add Media helper (this is optional) -->
	<script type="text/javascript" src="/fancybox/helpers/jquery.fancybox-media.js?v=1.0.5" />
	
	<!-- END FANCYBOX CODE -->

	<script type="text/javascript">
		$(document).ready(function() {
			$('.fancybox').fancybox();
		});
	</script>


</head>

<body>
	<div class="container">

		<h1>Benvenuto nel Botteghino Online! Scegli un evento e acquistalo subito: basta qualche click!!</h1>
		<h2 class="ss-subtitle">Botteghino timeline</h2>
		<div id="ss-links" class="ss-links">
			<a href="#gennaio">Gen</a> <a href="#febbraio">Feb</a> <a
				href="#marzo">Mar</a> <a href="#aprile">Apr</a> <a href="#maggio">Mag</a>
			<a href="#giugno">Giu</a> <br /> <a href="#luglio">Lug</a> <a
				href="#agosto">Ago</a> <a href="#september">Set</a> <a href="#september">Ott</a> <a
				href="#august">Nov</a> <a href="#july">Dic</a>
		</div>
		
		<div id="ss-categories" class="ss-links">
		<a href="#gennaio">Gen</a> <a href="#febbraio">Feb</a> <a
			href="#marzo">Mar</a> <a href="#aprile">Apr</a> <a href="#maggio">Mag</a>
		<a href="#giugno">Giu</a> <br /> <a href="#luglio">Lug</a> <a
			href="#agosto">Ago</a> <a href="#september">Set</a> <a href="#september">Ott</a> <a
			href="#august">Nov</a> <a href="#july">Dic</a>
	</div>
		
		<div id="ss-cart" class="ss-cart">
			<a href="#cart">Il tuo carrello è vuoto</a>
		</div>
		
		<div id="ss-container" class="ss-container">
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="gennaio">Gennaio</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>

			<s:iterator status="status" value="events">
				<s:if test="%{(#status.index)%3==0}">
					<div class="ss-row ss-medium">
					<div class="ss-left">
						<a href="http://tympanus.net/Tutorials/TypographyEffects/"
							class="ss-circle ss-circle-1">Image</a>
					</div>
					<div class="ss-right">
						<h3>
							<span><s:property value="authore" /></span> 
							
							<s:url action="detail.action" var="URLevent1">
								<s:param name="idEvent"><s:property value="id" /></s:param>
							</s:url> 
							<s:a cssClass="fancybox fancybox.ajax" href="%{URLevent1}">
								<s:property value="title" />
							</s:a>

						</h3>
					</div>
				</div>
				</s:if>
				<s:elseif test="%{(#status.index)%3==1}">
    				<div class="ss-row ss-large">
				<div class="ss-left">
					<h3>
						<span><s:property value="authore" /></span> 
						<s:url action="detail.action" var="URLevent2">
							<s:param name="idEvent"><s:property value="id" /></s:param>
						</s:url> 
						<s:a cssClass="fancybox fancybox.ajax" href="%{URLevent2}">
							<s:property value="title" />
						</s:a>						
					</h3>
				</div>
				<div class="ss-right">
					<a href="http://tympanus.net/Development/HoverClickTriggerCircle/"
						class="ss-circle ss-circle-2">Image</a>
				</div>
			</div>
				</s:elseif>
				<s:else>
    				<div class="ss-row ss-small">
				<div class="ss-left">
					<a href="http://tympanus.net/Tutorials/ElasticSlideshow/"
						class="ss-circle ss-circle-3">Image</a>
				</div>
				<div class="ss-right">
					<h3>
						<span><s:property value="authore" /></span> 
						<s:url action="detail.action" var="URLevent3">
							<s:param name="idEvent"><s:property value="id" /></s:param>
						</s:url> 
						<s:a cssClass="fancybox fancybox.ajax" href="%{URLevent3}">
							<s:property value="title" />
						</s:a>
					</h3>
				</div>
			</div>
				</s:else>
				
			</s:iterator>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="febbraio">Febbraio</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="marzo">Marzo</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="aprile">Aprile</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="maggio">Maggio</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="giungo">Giugno</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="luglio">Luglio</h2>
				</div>
				<div class="ss-right">
					<h2>Eventi</h2>
				</div>
			</div>
			
			<div class="ss-row">
				<div class="ss-left">
					<h2 id="august">August</h2>
				</div>
				<div class="ss-right">
					<h2>2011</h2>
				</div>
			</div>
		</div>
	</div>



	<!-- JAVASCRIPTs -->

<%-- 	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> --%>
	<script type="text/javascript" src="/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript">
	/* <![CDATA[ */
		$(function() {

			var $sidescroll	= (function() {
					
					// the row elements
				var $rows			= $('#ss-container > div.ss-row'),
					// we will cache the inviewport rows and the outside viewport rows
					$rowsViewport, $rowsOutViewport,
					// navigation menu links
					$links			= $('#ss-links > a'),
					// the window element
					$win			= $(window),
					// we will store the window sizes here
					winSize			= {},
					// used in the scroll setTimeout function
					anim			= false,
					// page scroll speed
					scollPageSpeed	= 2000 ,
					// page scroll easing
					scollPageEasing = 'easeInOutExpo',
					// perspective?
					hasPerspective	= false,
					
					perspective		= hasPerspective && Modernizr.csstransforms3d,
					// initialize function
					init			= function() {
						
						// get window sizes
						getWinSize();
						// initialize events
						initEvents();
						// define the inviewport selector
						defineViewport();
						// gets the elements that match the previous selector
						setViewportRows();
						// if perspective add css
						if( perspective ) {
							$rows.css({
								'-webkit-perspective'			: 600,
								'-webkit-perspective-origin'	: '50% 0%'
							});
						}
						// show the pointers for the inviewport rows
						$rowsViewport.find('a.ss-circle').addClass('ss-circle-deco');
						// set positions for each row
						placeRows();
						
					},
					// defines a selector that gathers the row elems that are initially visible.
					// the element is visible if its top is less than the window's height.
					// these elements will not be affected when scrolling the page.
					defineViewport	= function() {
					
						$.extend( $.expr[':'], {
						
							inviewport	: function ( el ) {
								if ( $(el).offset().top < winSize.height ) {
									return true;
								}
								return false;
							}
						
						});
					
					},
					// checks which rows are initially visible 
					setViewportRows	= function() {
						
						$rowsViewport 		= $rows.filter(':inviewport');
						$rowsOutViewport	= $rows.not( $rowsViewport )
						
					},
					// get window sizes
					getWinSize		= function() {
					
						winSize.width	= $win.width();
						winSize.height	= $win.height();
					
					},
					// initialize some events
					initEvents		= function() {
						
						// navigation menu links.
						// scroll to the respective section.
						$links.on( 'click.Scrolling', function( event ) {
							
							// scroll to the element that has id = menu's href
							$('html, body').stop().animate({
								scrollTop: $( $(this).attr('href') ).offset().top
							}, scollPageSpeed, scollPageEasing );
							
							return false;
						
						});
						
						$(window).on({
							// on window resize we need to redefine which rows are initially visible (this ones we will not animate).
							'resize.Scrolling' : function( event ) {
								
								// get the window sizes again
								getWinSize();
								// redefine which rows are initially visible (:inviewport)
								setViewportRows();
								// remove pointers for every row
								$rows.find('a.ss-circle').removeClass('ss-circle-deco');
								// show inviewport rows and respective pointers
								$rowsViewport.each( function() {
								
									$(this).find('div.ss-left')
										   .css({ left   : '0%' })
										   .end()
										   .find('div.ss-right')
										   .css({ right  : '0%' })
										   .end()
										   .find('a.ss-circle')
										   .addClass('ss-circle-deco');
								
								});
							
							},
							// when scrolling the page change the position of each row	
							'scroll.Scrolling' : function( event ) {
								
								// set a timeout to avoid that the 
								// placeRows function gets called on every scroll trigger
								if( anim ) return false;
								anim = true;
								setTimeout( function() {
									
									placeRows();
									anim = false;
									
								}, 10 );
							
							}
						});
					
					},
					// sets the position of the rows (left and right row elements).
					// Both of these elements will start with -50% for the left/right (not visible)
					// and this value should be 0% (final position) when the element is on the
					// center of the window.
					placeRows		= function() {
						
							// how much we scrolled so far
						var winscroll	= $win.scrollTop(),
							// the y value for the center of the screen
							winCenter	= winSize.height / 2 + winscroll;
						
						// for every row that is not inviewport
						$rowsOutViewport.each( function(i) {
							
							var $row	= $(this),
								// the left side element
								$rowL	= $row.find('div.ss-left'),
								// the right side element
								$rowR	= $row.find('div.ss-right'),
								// top value
								rowT	= $row.offset().top;
							
							// hide the row if it is under the viewport
							if( rowT > winSize.height + winscroll ) {
								
								if( perspective ) {
								
									$rowL.css({
										'-webkit-transform'	: 'translate3d(-75%, 0, 0) rotateY(-90deg) translate3d(-75%, 0, 0)',
										'opacity'			: 0
									});
									$rowR.css({
										'-webkit-transform'	: 'translate3d(75%, 0, 0) rotateY(90deg) translate3d(75%, 0, 0)',
										'opacity'			: 0
									});
								
								}
								else {
								
									$rowL.css({ left 		: '-50%' });
									$rowR.css({ right 		: '-50%' });
								
								}
								
							}
							// if not, the row should become visible (0% of left/right) as it gets closer to the center of the screen.
							else {
									
									// row's height
								var rowH	= $row.height(),
									// the value on each scrolling step will be proporcional to the distance from the center of the screen to its height
									factor 	= ( ( ( rowT + rowH / 2 ) - winCenter ) / ( winSize.height / 2 + rowH / 2 ) ),
									// value for the left / right of each side of the row.
									// 0% is the limit
									val		= Math.max( factor * 50, 0 );
									
								if( val <= 0 ) {
								
									// when 0% is reached show the pointer for that row
									if( !$row.data('pointer') ) {
									
										$row.data( 'pointer', true );
										$row.find('.ss-circle').addClass('ss-circle-deco');
									
									}
								
								}
								else {
									
									// the pointer should not be shown
									if( $row.data('pointer') ) {
										
										$row.data( 'pointer', false );
										$row.find('.ss-circle').removeClass('ss-circle-deco');
									
									}
									
								}
								
								// set calculated values
								if( perspective ) {
									
									var	t		= Math.max( factor * 75, 0 ),
										r		= Math.max( factor * 90, 0 ),
										o		= Math.min( Math.abs( factor - 1 ), 1 );
									
									$rowL.css({
										'-webkit-transform'	: 'translate3d(-' + t + '%, 0, 0) rotateY(-' + r + 'deg) translate3d(-' + t + '%, 0, 0)',
										'opacity'			: o
									});
									$rowR.css({
										'-webkit-transform'	: 'translate3d(' + t + '%, 0, 0) rotateY(' + r + 'deg) translate3d(' + t + '%, 0, 0)',
										'opacity'			: o
									});
								
								}
								else {
									
									$rowL.css({ left 	: - val + '%' });
									$rowR.css({ right 	: - val + '%' });
									
								}
								
							}	
						
						});
					
					};
				
				return { init : init };
			
			})();
			
			$sidescroll.init();
			
		});
		/* ]]> */
		</script>

</body>
</html>
