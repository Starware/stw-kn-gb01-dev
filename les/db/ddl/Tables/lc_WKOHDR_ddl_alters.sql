#use $MOCADIR/include
#use $DCSDIR/include
#use $SALDIR/include
#use $MCSDIR/include

#include <dcsddl.h>
#include <sqlDataTypes.h>
#include <dcscolwid.h>
#include <dcstbldef.h>

mset command on
[ALTER_TABLE_ADD_COLUMN_BEGIN(wkohdr, lc_lotnum_barcode_str)
    STRING_TY (20)
ALTER_TABLE_ADD_COLUMN_END]
catch(ERR_COLUMN_ALREADY_EXISTS)
RUN_DDL

mset command off