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
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-71635505-1', 'auto');
	  ga('send', 'pageview');		
</script>

<!-- Disqus -->
<script>
    /**
     *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
     *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables
     */
    
    var disqus_config = function () {
        this.page.url = 'http://tubecc-sridiyer.rhcloud.com/';  // Replace PAGE_URL with your page's canonical URL variable
        this.page.identifier = 'tube-cc'; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
    };
    
    function loadComments() {  // DON'T EDIT BELOW THIS LINE
        var d = document, s = d.createElement('script');
        
        s.src = '//tubecc.disqus.com/embed.js';
        
        s.setAttribute('data-timestamp', +new Date());
        (d.head || d.body).appendChild(s);
    };
</script>

<script type="text/javascript">
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
	
	var
		lang = 'en',
		stretching = 'fill',
		commentsLoaded = false;
		
	$(document).ready(function() {
		$( "#upload-div, #options-div, #url-div" ).accordion({
	    	active: false,
	    	collapsible: true,
	        heightStyle: "content"
	     }).show();
		
		$( "#comments-div" ).accordion({
	    	active: false,
	    	collapsible: true,
	        heightStyle: "content",
	        activate: function(event, ui) {
	            if(!commentsLoaded) {
	            	loadComments();
	            	commentsLoaded = true;
	            }
	    	}
	     }).show();
		
		$('#about-div,#supported-videos-div').dialog({
			height : "auto",
			width : "auto",
	      	autoOpen: false,
	      	modal: true,
	      	dialogClass: 'about-dialog',
	      	open: function(event, ui) {
	      		var $dailog = $(this);
	             $('.ui-widget-overlay').bind('click', function() { 
	            	 $dailog.dialog('close');
	             }); 
	        }
		});
		
		$('#embed-div').dialog({
			height : "auto",
			width : "40%",
	      	autoOpen: false,
	      	modal: true,
	      	dialogClass: 'about-dialog',
	      	open: function(event, ui) {
	      		var $dailog = $(this);
	             $('.ui-widget-overlay').bind('click', function() { 
	            	 $dailog.dialog('close');
	             }); 
	        }
		});
				
		var $loading = $( "#loadingDiv" ).dialog({
	      autoOpen: false,
	      modal: true,
	      dialogClass: 'loading-dialog'
		});
		
		$(document).ajaxStart(function () {
			$loading.dialog('open');
		}).ajaxStop(function () {
		    $loading.dialog('close');
		});
		
		$(".numeric").keypress(function (e) {
		     //if the letter is not digit then display error and don't type anything
		     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
		     	return false;
		     }
		});
						
		
		mejs.i18n.language(lang);
		var playerEl = document.getElementById('mediaplayer');
		/* MediaElementPlayer.prototype.enterFullScreen_org = MediaElementPlayer.prototype.enterFullScreen;		
		MediaElementPlayer.prototype.enterFullScreen = function() {
		    enterFullScreen(playerEl);
		    this.enterFullScreen_org();
		}
		MediaElementPlayer.prototype.exitFullScreen_org = MediaElementPlayer.prototype.exitFullScreen;
		MediaElementPlayer.prototype.exitFullScreen = function() {
			console.log('exit');
			exitFullScreen(playerEl);
		    this.exitFullScreen_org();
		} */
		var player = new MediaElementPlayer(playerEl, {
		 	pluginPath: pluginPath,
	    	stretching: stretching,
	    	enableAutosize: true,	    	
	    	startLanguage: 'en',
	    	success: function(mediaElement, originalNode) {
	        }
		});
		
		function loadVideo(vidURL) {
			player.setSrc(vidURL);
		}
		
		function loadTrack(trackURL) {
			$('#vid-track').attr('src', trackURL);
			player.findTracks();
			player.loadTrack(0);
			player.setTrack('none');
			//player.setTrack('en');
		}
		
		$('#sync-btn').off('click').on('click', function() {
			var syncTime = parseInt($('#seconds').val());
			var aTextTrack = player.tracks[0];
		    var cues = aTextTrack.entries;
		    for(var i = 0; i < cues.length; i++) {
		    	cues[i].startTime = cues[i].startTime + syncTime;
		    	cues[i].endTime = cues[i].endTime + syncTime;
		    }
		});
				
		$('#url').on('blur', function() {
			var $url = $(this).val();
			if($url != '') {
				var formData = new FormData();
	            formData.append('url', $url);	            
			    $.ajax({
	                url : '<%=ctxPath%>/title',
	                data : formData,
	                processData : false,
	                contentType : false,
	                type : 'POST',
	                success : function(data) {
	                	loadVideo($url);
	    				$('#title').val(data);
	                },
	                error : function(err) {
	                    console.log(err);
	                }
	            });
			}			
		});
		
					
		$('#upload-subtitle').click(function() {
			var trackURL = '<%=ctxPath%>/file/';					
			var formData = new FormData();
            formData.append('file', $('input[type=file]')[0].files[0]);
            $.ajax({
                url : '<%=ctxPath%>/upload',
                data : formData,
                processData : false,
                contentType : false,
                type : 'POST',
                success : function(data) {
                	trackURL += data;
                	loadTrack(trackURL);
                },
                error : function(err) {
                    console.log(err);
                }
            });
		});
		
		function searchSubtitle() {
			var formData = new FormData();
            formData.append('title', $('#title').val());	            
		    $.ajax({
                url : '<%=ctxPath%>/subtitle',
                data : formData,
                processData : false,
                contentType : false,
                type : 'POST',
                success : function(result) {
                	$('#subtitle-results').empty();
                	if(result.data.length > 0) {
                		$.each(result.data, function() {
                			var $this = this;
                			var $a = $('<a href="#">' + $this.MovieName + "(" + $this.SubFileName + ") - " + $this.LanguageName + '</a>');
                			$a.click(function(event) {
                				event.preventDefault();
                				var trackURL = '<%=ctxPath%>/file/';
                				var formData = new FormData();
               		            formData.append('ospath', $this.SubDownloadLink);	            
               				    $.ajax({
               		                url : '<%=ctxPath%>/uploados',
               		                data : formData,
               		                processData : false,
               		                contentType : false,
               		                type : 'POST',
               		                success : function(data) {
               		                	trackURL += data;
               		                	loadTrack(trackURL);
               		                },
               		                error : function(err) {
               		                    console.log(err);
               		                }
               		            });
                			});
                			$('#subtitle-results').append($('<div></div>').append($a));
                		});
                	} else {
                		$('#subtitle-results').append('<div>No results found</div>');
                	}
                },
                error : function(err) {
                    console.log(err);
                }
            });
		}
		$('#search-subtitle').click(function() {
			searchSubtitle();
		});
		$('#title').keyup(function(e){
		    if(e.keyCode == 13) {
		    	searchSubtitle();
		    }
		});
		
		
		$('#load-cc-btn').click(function() {
			var $ccURL = $('#cc-url').val();
			if($ccURL != '') {
				loadTrack('<%= ctxPath%>/proxy?_url=' + $ccURL);
			}
		});

		loadVideo('https://www.youtube.com/watch?v=q3ZubzERSmY');
	});
</script>
