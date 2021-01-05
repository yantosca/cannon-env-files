
PANOPLY

  panoply \PAN-uh-plee\, noun: 1. A splendid or impressive array. [...]


INTRODUCTION

  Panoply is a Java application which enables the user to make plots of
  two-dimensional geo-gridded data from netCDF and HDF datasets, either 
  global longitude-latitude plots, pole-to-pole latitude-vertical plots,
  or time-latitude "keogram" plots. 2D arrays may be "sliced" from larger multidimensional arrays (aka, variables). A large selection of global
  map projections is available for lon-lat figures. Plot images may be
  saved to disk in PDF, PNG, PS or GIF format.

  Panoply requires that Java 6 be installed on your computer. See the
  Java.com website for a free download of Java if you do not have it
  already installed.


DOWNLOADING

  The current version of Panoply, along with other information about the
  application, may always be found at

  http://www.giss.nasa.gov/tools/panoply/


INSTALLING AND RUNNING THE "STANDARD" PANOPLY PACKAGE

  The complete Panoply "Generic" package should, after uncompression, include
  the following items:
  
  - Panoply launcher in a shell command file called "panoply.sh".
  - Application code files in a folder called "jars".
  - This README file.
  
  On most platforms, you may be able to launch Panoply by
  double-clicking on the Panoply.jar icon on the desktop. However, doing
  so means that Panoply will not be allocated enough memory when it is
  started, and it will likely not work correctly.

  Instead, you should run Panoply from the shell command line; 'cd' into
  the directory where the above files are located and then type:
  
  ./panoply.sh

  This should execute a command in the shell file which starts Panoply and
  requests that it be allocated 1 GB of memory.


JAR FILES

  The folder called jars _must_ remain in the same directory as the
  panoply.sh application, and all the "jar" files it holds must remain
  in the jars folder. These file contain the Panoply application code
  and (re)moving any of them will break Panoply.


HELP AND OTHER DOCUMENTATION

  More details about Panoply are available at:
  
    http://www.giss.nasa.gov/tools/panoply/
  
  There are additional installation notes at
  
    http://www.giss.nasa.gov/tools/panoply/download_mac.html
  
  which provide solutions for a few basic installation problems.


COLOR TABLES AND CONTINENTS FILES

  Beginning with version 4, Panoply's "standard" selection of color tables
  and map overlays is built into the application. Additional color tables
  and map overlays may be opened for a single session or added to your
  favorites library for continued use. See the Panoply website for
  for such optional support files.


CONTACT

  Panoply was written by Dr. Robert B. Schmunk. Please send bug reports,
  etc., to:
  
  Robert B. Schmunk
  robert.b.schmunk@nasa.gov
  NASA Goddard Institute for Space Studies
  2880 Broadway, New York, NY 10025 USA


ACKNOWLEDGMENTS

  Panoply uses Java classes and libraries written by several third-party
  organizations. A complete list, with hyperlinks to pertinent websites
  containing license information and source code, may be found in Panoply's
  help windows or on the Panoply website.
