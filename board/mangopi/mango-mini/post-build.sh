#!/bin/bash
# Add a console to ttyGS0 (USB gadget serial port)
if [ -e ${TARGET_DIR}/etc/inittab ]; then
	if ! grep -qE 'ttyGS0' ${TARGET_DIR}/etc/inittab ; then
		echo "ttyGS0::respawn:/sbin/getty -L ttyGS0 0 vt100 # USB Gadget Serial" >> "${TARGET_DIR}/etc/inittab"
	fi
fi
