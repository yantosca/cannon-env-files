#!/bin/bash

#EOC
#------------------------------------------------------------------------------
#                  GEOS-Chem Global Chemical Transport Model                  !
#------------------------------------------------------------------------------
#BOP
#
# !IROUTINE: awake
#
# !DESCRIPTION: Script to print out to the screen every 10 minutes.  This
#  is meant to avoid having the Odyssey interactive session hang becuause
#  of user idle time.
#\\
#\\
# !CALLING SEQUENCE:
#  awake.sh
#
# !REMARKS:
#
# !REVISION HISTORY:
#  Use the "gitk browser" to view the Git version history!
#EOP
#------------------------------------------------------------------------------
#BOC

# Maximum number of iterations
# (every 10 mins for an 10-hour session = 60 iterations)
COUNTER=60
 
# Sleep for 10 mins, then issue a command that does nothing (but which will 
# provide some activity so that the interactive sessione doesn't time out).
# Repeat until we hit the maximum number of iterations.
while [[ $COUNTER -gt 0 ]]; do
  sleep 10m
  echo ""
  let COUNTER=COUNTER-1
done

# Exit normally
exit 0