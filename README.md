ArchivesSpace Eraser README
---------------------------

# Description

This plugin adds a convenient "one-click"&trade; solution for the problem of 
data persistence. If you are tired of laboriously entering or importing data
to the ArchivesSpace application only to see it monotonously perdure, this 
is the plug-in for you.

Features:
* Allows any user to permanently and irretrievably erase all your data.
* No pesky confirmation pop-ups or other safety measures.
* Affords the destructive power of the command line to end-users.

# Getting started

Detailed instructions can be found here:

     https://github.com/archivesspace/archivesspace/tree/master/plugins

Basic instructions:

      cd archivesspace/plugins
      git clone https://github.com/lcdhoffman/aspace-eraser.git
      cd ../common/config
      touch config.yml
      echo "AppConfig[:plugins] << 'aspace-eraser'" >> config.yml


