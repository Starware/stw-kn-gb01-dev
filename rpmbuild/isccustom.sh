#!/bin/bash
#
# WARNING: THIS SCRIPT EXPLICITLY IGNORES THE ERRORS, if not the script never
#          completes....
# test
#

export POSTINSTALL_LOG=$LESDIR/install/isccustom.log

if [ -f ${POSTINSTALL_LOG} ]; then
    /bin/rm -f ${POSTINSTALL_LOG}
fi
echo "Starting postintall" > ${POSTINSTALL_LOG}
date >> ${POSTINSTALL_LOG}

#cd $LESDIR
#echo "running mbuild" >> ${POSTINSTALL_LOG}
#mbuild 2>&1 >> ${POSTINSTALL_LOG}

#echo "cd $LESDIR/db/data/load/base/bootstraponly" >> ${POSTINSTALL_LOG}
#cd $LESDIR/db/data/load/base/bootstraponly
#echo "running mload_all" >> ${POSTINSTALL_LOG}
#mload_all 2>&1 >> ${POSTINSTALL_LOG}

#echo "cd $LESDIR/db/data/load/base/safetoload" >> ${POSTINSTALL_LOG}
#cd $LESDIR/db/data/load/base/safetoload
#echo "running mload_all" >> ${POSTINSTALL_LOG}
#mload_all 2>&1 >> ${POSTINSTALL_LOG}

date >> ${POSTINSTALL_LOG}
echo "Done" >> ${POSTINSTALL_LOG}

exit 0
