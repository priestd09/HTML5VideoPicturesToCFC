HTML5VideoPicturesToCFC
=======================

This code is based on code that Raymond Camden blogged.
http://www.raymondcamden.com/index.cfm/2012/4/6/Face-detection-with-getUserMedia

It works in Chrome 21.0.1180.75 on PC.  I have not tested any other browsers yet.

Chrome will ask you if it is ok for the web page to use your web camera.  When you click yes is displays a live feed
from your web camera.

Click on the "Say Cheese" button and it takes an image displays it on the web page and transmits it to a ColdFusion
CFC.  A CFM file will work just the same if you want to put the CF code on a CFM page instead.

The CFC then returns the name of the image that was written to the server.

Update 8/17/2012
One thing i also noticed is the JPG images are very large, about 200K.  

In production i used Efflare's ImageCR to re-save the JPG and it brought it down to a much more appropriate 30K.

CFImage will probably clean it up also, but i like ImageCR better.

