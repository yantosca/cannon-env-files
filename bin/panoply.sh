#!/bin/bash
#

#SCRIPT=`readlink -f $0`
#SCRIPTDIR=`dirname $SCRIPT`

#java -Xmx1G -Xms128m -jar $SCRIPTDIR/jars/Panoply.jar "$@"


# Point to installation in the bin/PanoplyJ folder
java -Xmx1G -Xms128m -jar $HOME/bin/PanoplyJ/jars/Panoply.jar "$@"

