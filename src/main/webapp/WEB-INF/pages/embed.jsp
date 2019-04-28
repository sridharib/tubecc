<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
	<head>	
		<%
			String ctxPath = request.getContextPath();
			String desc = "Captioning Someone else's YouTube, Vimeo, DailyMotion and more,Add subtitle to YouTube, Vimeo, DailyMotion and more, YouTube Subtitle, Vimeo Subtitle, DailyMotion Subtitle, Subtitle, YouTube SRT, Vimeo SRT, DailyMotion SRT, YouTube, Vimeo, DailyMotion VTT";
		%>
		<link rel="icon" href="<c:url value="/resources/img/cc.ico" />" type="image/x-icon" />
		<title>Tube CC - Add subtitle to Youtube Vimeo DailyMotion and many more videos</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="description" content="<%= desc %>" />
		<meta name="viewport" content="width=device-width, initial-scale=1">		
		<meta name="google-site-verification" content="K25iIFvQBPCr_6Xp7xqf5E2j-g3LBryy6W4Dv02kn5c" />
		<meta name="msvalidate.01" content="3AFC29EF8F0955358F55937BD5C6335A" />
		
		<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
		<link href="<c:url value="/resources/css/jquery-ui.min.css" />" rel="stylesheet">
		<!-- Optional theme -->
		<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.min.css" />">
		<link rel="stylesheet" href="<c:url value="/resources/css/main.css" />">
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    	<link rel="stylesheet" href="<c:url value="/resources/css/mediaelementplayer.min.css" />">	
    	
	    <style>	
	        #container {
	            padding: 0 20px 50px;
	        }
	        .error {
	            color: red;
	        }
	        a {
	            word-wrap: break-word;
	        }
	
	        #player2-container .mejs__time-buffering, #player2-container .mejs__time-current, #player2-container .mejs__time-handle,
	        #player2-container .mejs__time-loaded, #player2-container .mejs__time-marker, #player2-container .mejs__time-total {
	            height: 2px;
	        }
	
	        #player2-container .mejs__time-total {
	            margin-top: 9px;
	        }
	        #player2-container .mejs__time-handle {
	            left: -10px;
	            width: 12px;
	            height: 12px;
	            border-radius: 50%;
	            background: #ffffff;
	            top: -5px;
	            cursor: pointer;
	            display: block;
	            position: absolute;
	            z-index: 1;
	            border: none;
	        }
	
	    </style>
	</head>
	
	<body style="height : 100%">
		<div class="media-wrapper" style="height : 100%">
			<video id="mediaplayer">
				<source src="${param.vidSrc}" id="vid-source">
				<track id="vid-track" srclang="en" kind="subtitles" label="Default" src="<%= ctxPath%>/proxy?_url=${param["vidTrack"]}" />
			</video>
		</div>
	</body>
	
	<script src="<c:url value="/resources/js/jquery-2.1.4.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
	
	<script src="<c:url value="/resources/js/mediaelement/mediaelement-and-player.min.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/renderers/dailymotion.min.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/renderers/facebook.min.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/renderers/soundcloud.min.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/renderers/twitch.min.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/renderers/vimeo.min.js" />"></script>
	
	<script src="<c:url value="/resources/js/mediaelement/lang/cs.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/de.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/es.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/fr.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/hr.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/hu.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/it.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/ja.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/ko.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/nl.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/pl.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/pt.js" />\"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/pt-br.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/ro.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/ru.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/sk.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/sv.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/uk.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/zh-cn.js" />"></script>
	<script src="<c:url value="/resources/js/mediaelement/lang/zh.js" />"></script>
	<script>
		function enterFullScreen(docElm) {
			if (docElm.requestFullscreen) {
			    docElm.requestFullscreen();
			}
			else if (docElm.mozRequestFullScreen) {
			    docElm.mozRequestFullScreen();
			}
			else if (docElm.webkitRequestFullscreen) {
			    docElm.webkitRequestFullscreen();
			}
			else if (docElm.msRequestFullscreen) {
			    docElm.msRequestFullscreen();
			}
		}
		
		function exitFullScreen(document) {
			if (document.exitFullscreen) {
			    document.exitFullscreen();
			}
			else if (document.mozCancelFullScreen) {
			    document.mozCancelFullScreen();
			}
			else if (document.webkitCancelFullScreen) {
			    document.webkitCancelFullScreen();
			}
			else if (document.msExitFullscreen) {
			    document.msExitFullscreen();
			}
		}
		
		var pluginPath = '<c:url value="/resources/js/mediaelement/" />';
		var lang = 'en', stretching = 'fill';
		mejs.i18n.language(lang);
		
		var playerEl = document.getElementById('mediaplayer');
		MediaElementPlayer.prototype.enterFullScreen_org = MediaElementPlayer.prototype.enterFullScreen;		
		MediaElementPlayer.prototype.enterFullScreen = function() {
		    enterFullScreen(playerEl);
		    this.enterFullScreen_org();
		}
		MediaElementPlayer.prototype.exitFullScreen_org = MediaElementPlayer.prototype.exitFullScreen;
		MediaElementPlayer.prototype.exitFullScreen = function() {
			exitFullScreen(playerEl);
		    this.exitFullScreen_org();
		}
		
		var player = new MediaElementPlayer(playerEl, {
		 	pluginPath: pluginPath,
	    	stretching: stretching,
	    	enableAutosize: true,
	    	startLanguage: 'en',
	    	success: function(mediaElement, originalNode) {
	        }
		});
		player.findTracks();
		player.loadTrack(0);
		player.setTrack('none');
	</script>
	
	
	<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		  ga('create', 'UA-71635505-1', 'auto');
		  ga('send', 'pageview');		
	</script>
</html>