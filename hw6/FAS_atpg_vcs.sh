#!/bin/sh
# CAUTION!!! ZERO-DELAY PARAMETERS SPECIFIED HERE
LIB_FILES=""
NETLIST_FILES=" FAS_dft.v tsmc13.v"
DPV_FILE="FAS_atpg_stildpv.v"
SIMULATOR="vcs"
if [ -z "${STILDPV_HOME}" -o ! -d "${STILDPV_HOME}" ]
then echo "ERROR: Please define \$STILDPV_HOME to reference a directory"; exit 1;
fi
${SIMULATOR} -R +acc+2 -P ${STILDPV_HOME}/lib/stildpv_vcs.tab \
 +tetramax +delay_mode_zero \
${DPV_FILE} ${NETLIST_FILES} ${LIB_FILES} \
${STILDPV_HOME}/lib/libstildpv.a
SIMSTATUS=$?
if [ ${SIMSTATUS} -ne 0 ]
then echo "WARNING: simulation command returned error status ${SIMSTATUS}"; exit ${SIMSTATUS};
fi
