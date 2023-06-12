<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    	<link rel="stylesheet" href="<c:url value="/resources/js/mediaelement/mediaelementplayer.min.css" />">	
    	
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
	
	<body>
		<div class="container-fluid" style="height : 100%;">
			<div id="header">
				<div class="row">
					<div class="col-md-12">
						<img alt="" src="<c:url value="/resources/img/tv.png" />">
						<img alt="" src="<c:url value="/resources/img/cc.png" />" style="margin-top: 13px;">
					</div>				
				</div>
				<hr>
			</div>
			
			<div id="body">
				<div class="row">
					<div class="col-md-12">					
						<form action="#" method="post" id="frm" onsubmit="return false;">
							<div class="col-md-7">
								<div>
									<input type="text" id="url" name="url" placeholder="Enter URL eg. https://www.youtube.com/watch?v=5dsGWM5XGdg" style="width: 100%">
								</div>
								
								<div class="extra-top-margin extra-bottom-margin" id="video-div">
									<div class="media-wrapper">
										<video id="mediaplayer" width="640" height="360">
											<source src="https://media.w3.org/2010/05/sintel/trailer.mp4" id="vid-source">
											<track id="vid-track" srclang="en" kind="subtitles" label="Default" src="" />
										</video>
									</div>
								</div>
																
								<div id="options-div" style="display : none;" class="extra-bottom-margin">
									<h3>Settings</h3>
									<div>
						                <button class="medium-height"  onclick="$('#seconds').val(parseInt($('#seconds').val()) - 1);">-</button>
										<input type="text" id="seconds" size="1" value="0" class="medium-height numeric">
										<button class="medium-height" onclick="$('#seconds').val(parseInt($('#seconds').val()) + 1);">+</button>
										Seconds
										<button class="medium-height" id="sync-btn">Sync</button>
									</div>
								</div>
							</div>						
							
							<div class="col-md-5">
								<div>
									<input type="text" id="title" class="col-md-8" name="title" placeholder="Enter video title">
									<input type="button" id="search-subtitle" value="Search Subtitle" class="btn btn-info col-md-3">	
								</div>
								<div class="extra-top-margin" id="subtitle-results">&nbsp;</div>
								
								<div id="upload-div" class="extra-top-margin" style="display: none;">
									<h3>Upload SRT or VTT</h3>
									<div>
										<input type="file" name="file" id="file">
										<input type="button" id="upload-subtitle" value="Load" class="btn btn-info">
									</div>									
								</div>
								
								<div id="url-div" class="extra-top-margin" style="display: none;">
									<h3>Load Captions from URL</h3>
									<div>
										<input type="text" name="cc-url" id="cc-url" class="col-md-8" 
											placeholder="eg. http://vplaytv.me/subs/22.Jump.Street.2014.srt">
										<input type="button" id="load-cc-btn" value="Load" class="btn btn-info">
									</div>									
								</div>			
							</div>											
						</form>
					</div>
					
					<div class="col-md-12">
						<div class="col-md-7">
							<p>
								Add subtitle to Youtube, Vimeo, DailyMotion and many more videos
								(<a href="#" onclick="$('#supported-videos-div').dialog('open');return false;">See Supported Videos</a>). 
								Paste the video link in the text box above and search the subtitle.
								If the subtitle is found then click on the link to add it to the video or upload your srt/vtt file.
							</p>
							<p>
								If the track is not synchronized with the video then you can synchronize it using the settings above.
							</p>
						</div>
						<div class="col-md-7">
							<!-- AddToAny BEGIN -->
							<div class="a2a_kit a2a_default_style">
								<a class="a2a_button_facebook"></a>
								<a class="a2a_button_google_plus"></a>
								<a class="a2a_button_twitter"></a>
								<span class="a2a_divider"></span>
								<a class="a2a_dd" href="https://www.addtoany.com/share">Share</a>
							</div>
							<script type="text/javascript" src="//static.addtoany.com/menu/page.js"></script>
							<!-- AddToAny END -->
						</div>
						<div class="col-md-7">
							<div id="comments-div" style="display : none;">
								<h3>Comments</h3>
								<div id="disqus_thread"></div>
							</div>
						</div>						
					</div>	
				</div>
			</div>
			
			<div id="footer">
				<hr>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-4">
							<a href="#" onclick="$('#about-div').dialog('open');return false;" style="font-weight: bold;">
								About
							</a>
						</div>
						<div class="col-md-4">
							<a href="#" onclick="$('#supported-videos-div').dialog('open');return false;" style="font-weight: bold;">
								Supported Videos
							</a>
						</div>
						<div class="col-md-2">
							<a href="#" onclick="$('#embed-div').dialog('open');return false;" style="font-weight: bold;">
								Embed
							</a>
						</div>	
						<div class="col-md-2">
							<a href="http://bit.ly/tubecc-n" style="font-weight: bold;">
								New Version
							</a>
						</div>	
					</div>					
				</div>
			</div>		
		</div>
		
		<div style="display:none">
			<div id="about-div">
				<p>
					Created by Sridhar Iyer
				</p>
				<p style="font-weight: bold;">
					<a href="https://plus.google.com/u/0/+sridhariyer85" target="_blank">Goolge+</a>
					<a href="https://in.linkedin.com/in/sridiyer" target="_blank">LinkedIn</a>
				</p>
				<p>
					Video player <a href="http://www.mediaelementjs.com/" target="_blank">MediaElementJS</a>
				</p>
				<p>			
					The subtitle service is provided by <a href="http://www.opensubtitles.org" target="_blank">www.opensubtitles.org</a>
				</p>				
			</div>
			
			<div id="supported-videos-div">
				<p><b>Example URl:</b></p>
				<p>						
					<b>DailyMotion</b> : http://www.dailymotion.com/embed/video/x2lzodk
				</p>
				<p>						
					<b>YouTube</b> : https://www.youtube.com/watch?v=twYp6W6vt2U
				</p>
				<p>						
					<b>Vimeo</b> : https://vimeo.com/53253713
				</p>
				<p>						
					<b>Facebook</b> : https://www.facebook.com/facebook/videos/10155278547321729
				</p>
				<p>						
					<b>Twitch</b> : https://www.twitch.tv/videos/109010497
				</p>
				<p>						
					<b>MP4</b> : https://media.w3.org/2010/05/sintel/trailer.mp4
				</p>
				<p>						
					<b>MP4 (no ext.)</b> : http://ep-lin-upload.s3.amazonaws.com/vupl_lin/F64/CDF/F64CDF3B0348471E95C244DE2DDDD3F3
				</p>
				<p>						
					<b>WebM</b> : https://upload.wikimedia.org/wikipedia/commons/2/22/Volcano_Lava_Sample.webm
				</p>
				<p>						
					<b>RTMP</b> : rtmp://firehose.cul.columbia.edu:1935/vod/mp4:sample.mp4
				</p>
				<p>						
					<b>HLS</b> : http://www.streambox.fr/playlists/test_001/stream.m3u8
				</p>
				<p>						
					<b>M(PEG)-DASH</b> : http://www.bok.net/dash/tears_of_steel/cleartext/stream.mpd
				</p>
				<p>						
					<b>FLV</b> : http://la2.indexcom.com/me/flv/guqin.flv
				</p>							
			</div>
			
			<div id="embed-div">
				<p style="width: 70%;">
					&lt;iframe src="http://tiny.cc/subtitle/embed/?<b>vidTrack={location of the subtitle file}
						&vidSrc={location of the video source}</b>" webkitAllowFullScreen mozallowFullScreen 
						allowFullScreen width="400" height="400" frameborder="0" allowtransparency="true"&gt;&lt;/iframe&gt;
				</p>
				<p style="width: 70%;">
					<b>eg.</b>
					&lt;iframe src="http://tiny.cc/subtitle/embed/?<b>vidTrack=http://vplaytv.me/subs/22.Jump.Street.2014.srt
						&vidSrc=https://www.youtube.com/watch?v=5dsGWM5XGdg</b>" webkitAllowFullScreen mozallowFullScreen 
						allowFullScreen width="400" height="400" frameborder="0" allowtransparency="true"&gt;&lt;/iframe&gt;
				</p>
							
			</div>
			
			<div id="loadingDiv">
				<img alt="" src="<c:url value="/resources/img/ajax-loader.gif" />" style="display: block;margin-left: auto;margin-right: auto;">
			</div>
		</div>		
	</body>
	
	<script src="<c:url value="/resources/js/jquery-2.1.4.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>	
	<%@ include file="demo.jsp" %>
</html>
