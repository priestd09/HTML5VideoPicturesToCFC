<!--- 
credit to Ray Camden for the base code 
http://www.raymondcamden.com/index.cfm/2012/4/6/Face-detection-with-getUserMedia
--->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Super Awesome Picture Taking and Saving to CFC</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

  </head>
	
  <body onload="init()">

    <div class="container">

		<style>
		video { width: 40%; }
		canvas { width: 40%; }
		</style>
		
		<script>
		function errorHandler(e) {
			console.log("Error");
			console.dir(e);
		}
		
		function init() {
		
			if (navigator.webkitGetUserMedia) {
		
				navigator.webkitGetUserMedia({video:true}, gotStream, noStream);
		
				var video = document.getElementById('monitor');
				var canvas = document.getElementById('photo');
		
				function gotStream(stream) {
		
					video.src = webkitURL.createObjectURL(stream);
					video.onerror = function () {
						stream.stop();
						streamError();
					};
					document.getElementById('splash').hidden = true;
					document.getElementById('app').hidden = false;
					$("#snapshotbutton").click(snapshot);
				}
		
				function noStream() {
					document.getElementById('errorMessage').textContent = 'No camera available.';
				}
		
				function streamError() {
					document.getElementById('errorMessage').textContent = 'Camera error.';
				}
		
				function snapshot() {
		
					canvas.width = video.videoWidth;
					canvas.height = video.videoHeight;
					canvas.getContext('2d').drawImage(video, 0, 0);
							
					var data = canvas.toDataURL('image/jpeg', 1.0);
		
					var formdata = new FormData();
					formdata.append("filename","temp.jpg");
					formdata.append("file",data); 
		
					 $.ajax({
						 url: 'http://#CGI.SERVER_NAME#/file.cfc?method=updateProduct',
						 data: formdata,
						 cache: false,
						 contentType: false,
						 processData: false,
						 dataType:"json",
						 type: 'POST',
						 success: function (data) {
							 console.log(data);
							 $("#result").val(JSON.parse(JSON.stringify(data.picture)));
						 }
		
					 });    
		
				}
		
		
			} else {
				document.getElementById('errorMessage').textContent = 'No native camera support available.';
			}
		
		}
		</script>

		<section id="splash">
			<p id="errorMessage"></p>
		</section>
		
		<section id="app" hidden>
			<p><video id="monitor" autoplay></video> <canvas id="photo"></canvas></p>
			<p><input value="say cheese!" type=button value="&#x1F4F7;" id="snapshotbutton">
		</section>
		
		<div id="resultDiv">
			<input id="result" />
		</div>
		
		<p>
		Credit for Video to Canvas: http://miernicki.com/cam.html
		</p>

    </div> <!-- /container -->

    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
 

  </body>
</html>
