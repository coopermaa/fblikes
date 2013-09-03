# fblikes

This project creates a real Facebook Likes LED Display. Check [my blog](http://bit.ly/17mDukQ) for more information.

What you need is an OpenWRT (running on TL-WR703N), Arduino and TM1638 LED Display.

## Installation

First, connect Arduino with TM1368 LED Display and upload fblikesDemo sketch in the arduino directory to Arduino board.

Upload install.sh and files directoy to OpenWRT, then run:

    $ chmod +x install.sh
    $ ./install.sh
    
This is will install fblikes scripts and related LuCI modules.

Make sure your OpenWRT is connected to internet, then run following command to start fblikes:

    $ /etc/init.d/fblikes start

Run following command if you want to put fblikes on Linux startup:    

    $ /etc/init.d/fblikes enable
    
Point your browser at 
http://&lt;IP of OpenWRT&gt;/cgi-bin/luci/fblikes to configure settings.

Here is a screencut of Facebook Likes LED Display, the Facebook Fans's page of Fablab Taipei:

![screencut](http://bit.ly/15ouPyH)

the Arduino LED Display:

![screencut](http://bit.ly/13802s0)

and the LuCI configuration User interface for this application:

![screencut](http://bit.ly/15ovm3m)