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

cd $LESDIR
echo "running mbuild" >> ${POSTINSTALL_LOG}
mbuild 2>&1 >> ${POSTINSTALL_LOG}

echo "cd $LESDIR/db/data/load/base/bootstraponly" >> ${POSTINSTALL_LOG}
cd $LESDIR/db/data/load/base/bootstraponly
echo "running mload_all" >> ${POSTINSTALL_LOG}
mload_all 2>&1 >> ${POSTINSTALL_LOG}

echo "cd $LESDIR/db/data/load/base/safetoload" >> ${POSTINSTALL_LOG}
cd $LESDIR/db/data/load/base/safetoload
echo "running mload_all" >> ${POSTINSTALL_LOG}
mload_all 2>&1 >> ${POSTINSTALL_LOG}

echo "cd $LESDIR/db/ddl/Tables" >> ${POSTINSTALL_LOG}
cd $LESDIR/db/ddl/Tables
echo "running installsql in " >> ${POSTINSTALL_LOG}
installsql *.tbl 2>&1 >> ${POSTINSTALL_LOG} || false

# Remove some existing system setup by looping over all msql files
for x in $LESDIR/db/data/unload/integrator/lc/*.msql; do
    echo "msql @ " $x >> ${POSTINSTALL_LOG}
    printf "@ %s" $x | $MOCADIR/bin/msql -S 2>&1 >> ${POSTINSTALL_LOG} || false
done

# SLEXP files
echo "slImp -f LC_PART_INB_IFD.slexp -v" >> ${POSTINSTALL_LOG}
slImp -f $LESDIR/db/data/load/integrator/lc/LC_PART_INB_IFD.slexp -v 2>&1 >> ${POSTINSTALL_LOG} || false

echo "slImp -f LC_ORDER_INB_IFD.slexp -v" >> ${POSTINSTALL_LOG}
slImp -f $LESDIR/db/data/load/integrator/lc/LC_ORDER_INB_IFD.slexp -v 2>&1 >> ${POSTINSTALL_LOG} || false

echo "slImp -f LC-ORDER-INB-IFD.slexp -v" >> ${POSTINSTALL_LOG}
slImp -f $LESDIR/db/data/load/integrator/lc/LC-HUEL-ORDER-INB-IFD.slexp -v 2>&1 >> ${POSTINSTALL_LOG} || false

echo "slImp -f LC-RA-INB-IFD.slexp -v" >> ${POSTINSTALL_LOG}
slImp -f $LESDIR/db/data/load/integrator/lc/LC-HUEL-RA-INB-IFD.slexp -v 2>&1 >> ${POSTINSTALL_LOG} || false

echo "slImp -f LC-HUEL-ORDER-INB-ACK.slexp -v" >> ${POSTINSTALL_LOG}
slImp -f $LESDIR/db/data/load/integrator/lc/LC-HUEL-ORDER-INB-ACK.slexp -v 2>&1 >> ${POSTINSTALL_LOG} || false

echo "slImp -f LC-HUEL-RA-INB-ACK.slexp -v" >> ${POSTINSTALL_LOG}
slImp -f $LESDIR/db/data/load/integrator/lc/LC-HUEL-RA-INB-ACK.slexp -v 2>&1 >> ${POSTINSTALL_LOG} || false

echo "slImp -f HOST_HTTP_COMMUNICATIONS.slexp -v" >> ${POSTINSTALL_LOG}
slImp -f $LESDIR/db/data/load/integrator/lc/HOST_HTTP_COMMUNICATIONS.slexp -v 2>&1 >> ${POSTINSTALL_LOG} || false

echo "slImp -f LC-WO-CLOSE.slexp -v" >> ${POSTINSTALL_LOG}
slImp -f $LESDIR/db/data/load/integrator/lc/LC-WO-CLOSE.slexp -v 2>&1 >> ${POSTINSTALL_LOG} || false


date >> ${POSTINSTALL_LOG}
echo "Done" >> ${POSTINSTALL_LOG}

exit 0
