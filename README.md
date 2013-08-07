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

# Installation

Basic instructions:

      cd archivesspace/plugins
      git clone https://github.com/lcdhoffman/aspace-eraser.git
      cd ../common/config
      touch config.rb
      echo "AppConfig[:plugins] << 'aspace-eraser'" >> config.rb

Detailed instructions:

     https://github.com/archivesspace/archivesspace/tree/master/plugins

It goes without saying, but don't install this plug-in unless you are
absolutely certain that your data is disposable (i.e., test data).

# Usage

Open the "Plug-ins" menu at the top right-hand side of the user interface.
Select "Erase Database"

Your session information will be deleted along with everything else, so 
you will be returned to the Welcome screen with a "backend session not 
found" message. Log back in using the default administrator account.


