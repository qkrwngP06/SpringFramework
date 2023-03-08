<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Welcome to Spring Web</title>
		<style>
			*{
				box-sizing:board-box;
			}
			 
			 .video-film {
				box-shadow: rgba(0, 7, 15, 0.7) 0 0 0 9999px;
				z-index: 100;
			}
			
			.video-background {
				background: #000;
				position: fixed;
				top: 0;
				right: 0;
				bottom: 0;
				left: 0;
				z-index: -99;
			}
			
			.video-foreground, .video-background iframe {
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				pointer-events: none;
			}
			
			@media ( min-aspect-ratio : 16/9) {
				.video-foreground {
					height: 300%;
					top: -100%;
				}
			}
			
			@media ( max-aspect-ratio : 16/9) {
				.video-foreground {
					width: 300%;
					left: -100%;
				}
			}
			
			h1 {
				color: white;
			}
			.center {
				position: absolute;
				top: 60%;
				left: 47%;
				margin: -50px 0 0 -50px;
			}
			
			#indexBtn {
				position: fixed;
				text-align: center;
			}
			
			#visual-btn {
				z-index: 50;
				color: #fff;
				font-size: 20px;
				border: 2px solid #fff;
				padding: 12px 24px;
				border-radius: 5px;
				cursor: pointer;
				background-color: rgba(0, 0, 0, 0);
			}
			
			#visual-btn:hover {
				color: #ff6868;
				font-size: 20px;
				border: 2px solid #ff6868;
				padding: 12px 24px;
				border-radius: 5px;
				cursor: pointer;
			}
		</style>
	</head>
	<body>
		<%-- <jsp:forward page="/home.kh"></jsp:forward> --%>
		<h1>
			<!-- <img src="/resources/images/sitelogo.png" style="width: 50%; height: 50%;"> -->
		</h1>
		<div id=" indexBtn" class="center">
			<button id="visual-btn" onclick="location.href='/home.kh';">Visit Our Web Sites</button>
		</div>
		<div class="video-background">
			<div id="muteYouTubeVideoPlayer"></div>
		</div>
		<div class="video-film"></div>

		<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
		<script async src="https://www.youtube.com/iframe_api"></script>
		<script type="text/javascript">
			var player;
	
			function onYouTubePlayerAPIReady() {
				player = new YT.Player('muteYouTubeVideoPlayer', {
					videoId : 'sxVhc54kFl0',  //실행하고 싶은 영상 ID
					playerVars : {
						autoplay : 1, // Auto-play the video on load
						controls : 0, // Show pause/play buttons in player
					},
					events : {
						onReady : function(e) {
							e.target.mute();
						}
					}
				});
			}
		</script>
	</body>
</html>