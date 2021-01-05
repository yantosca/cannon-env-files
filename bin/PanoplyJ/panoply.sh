#!/bin/sh
#

SCRIPT=`readlink -f $0`
SCRIPTDIR=`dirname $SCRIPT`

java -Xmx1G -Xms128m -jar $SCRIPTDIR/jars/Panoply.jar "$@"

