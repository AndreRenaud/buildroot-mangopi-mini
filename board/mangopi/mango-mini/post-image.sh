#!/bin/bash

set -e

BOARD_DIR="$(dirname $0)"
GENIMAGE_CFG=$BOARD_DIR/genimage.cfg
MKIMAGE=$HOST_DIR/bin/mkimage

$MKIMAGE -f "${BOARD_DIR}/mango-mini.its" "${BINARIES_DIR}/mango-mini.ub"

rm -rf $GENIMAGE_TMP

${HOST_DIR}/bin/genimage \
        --config ${GENIMAGE_CFG} \
        --rootpath $TARGET_DIR \
        --inputpath $BINARIES_DIR \
        --outputpath $BINARIES_DIR
