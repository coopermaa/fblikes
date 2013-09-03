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

Point your browser at 
http://&lt;IP of OpenWRT&gt;/cgi-bin/luci/fblikes to configure settings.


   