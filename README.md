### Bandwith Monitor for GeekTool  
MacOS 10.9.4 

GeekTool 3.1.1 (Not Mac App Store version)

go <a href="http://projects.tynsoe.org/en/geektool/">here</a> and download latest version.

rrdtools 

### rrdtool installation
Install rrdtool using brw or macports 

`brew install rrdtool`

or

`sudo port install rrdtool`

### Initialize the rrd database.
To make sure which adapter to use run ifconfig comand

`ifconfig`

Create a folder that you will store the scripts and graphs.

In my case I used my homedir and scripts direcotry

    mkdir ~/scripts/geektool/bwmonitor/
    cd ~/scripts/geektool/bwmonitor/
    rrdtool create bwusage_en0_db.rrd --step 10 DS:inbyts:COUNTER:20:0:U DS:oubyts:COUNTER:20:0:U RRA:MAX:0.5:1:900

copy com.bwmonitor.rrdupdate_en0.plist into /Library/LaunchDaemons

``cp com.bwmonitor.rrdupdate_en0.plist /Library/LaunchDaemons/com.bwmonitor.rrdupdate_en0.plist``

Run the 'launchctl' commands to load the plist files (make sure you are in LaunchDeamons directory first)

    cd /Library/LaunchDaemon
    launchctl load -w com.bwmonitor.rrdupdate_en0.plist
    launchctl load -w com.bwmonitor.rrdgraph_en0.plist

###ONLY DO THIS TO REMOVE THE PLIST FILES

    $ sudo -s
    cd /Library/LaunchDaemons
    launchctl unload com.bwmonitor.rrdupdate_en0.plist
    launchctl unload com.bwmonitor.rrdgraph_en0.plist
    rm com.bwmonitor.rrdupdate_en0.plist
    rm com.bwmonitor.rrdgraph_en0.plist

 
