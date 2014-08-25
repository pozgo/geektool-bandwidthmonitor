### README.md 
Installation of bandwith monitor under geek tools. 

MacOS 10.9.4 

GeekTool 3.1.1 (Not Mac App Store version)

go <a href="http://projects.tynsoe.org/en/geektool/">here</a> and download latest version.

### Install rrd tool
``brew install rrdtool``

Create a folder that you will store the scripts and graphs.

In my case I used my homedir and scripts direcotry

``mkdir ~/scripts/geektool/bwmonitor/``

``cd ~/scripts/geektool/bwmonitor/``

### Initialize the rrd database.
For ethernet card use en0 (or whatever settings are in your system) 

``rrdtool create bwusage_en0_db.rrd --step 10 DS:inbyts:COUNTER:20:0:U DS:oubyts:COUNTER:20:0:U RRA:MAX:0.5:1:900``


copy com.bwmonitor.rrdupdate_en0.plist into /Library/LaunchDaemons

Run the 'launchctl' commands to load the plist files

``launchctl load -w com.bwmonitor.rrdupdate_en0.plist``

``launchctl load -w com.bwmonitor.rrdgraph_en0.plist``

##ONLY DO THIS TO REMOVE THE PLIST FILES

``$ sudo -s``

``cd /Library/LaunchDaemons``

``launchctl unload com.bwmonitor.rrdupdate_en0.plist``

``launchctl unload com.bwmonitor.rrdgraph_en0.plist``

``rm com.bwmonitor.rrdupdate_en0.plist``

``rm com.bwmonitor.rrdgraph_en0.plist``



 
