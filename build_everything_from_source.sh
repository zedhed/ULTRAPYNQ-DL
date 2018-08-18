# ----------------------------------------------------------------------------
#
#        ** **        **          **  ****      **  **********  ********** ®
#       **   **        **        **   ** **     **  **              **
#      **     **        **      **    **  **    **  **              **
#     **       **        **    **     **   **   **  *********       **
#    **         **        **  **      **    **  **  **              **
#   **           **        ****       **     ** **  **              **
#  **  .........  **        **        **      ****  **********      **
#     ...........
#                                     Reach Further™
#
# ----------------------------------------------------------------------------
# 
#  This design is the property of Avnet.  Publication of this
#  design is not authorized without written consent from Avnet.
# 
#  Please direct any questions to the Ultra96 community support forum:
#     http://www.ultra96.org/forum
# 
#  Product information is available at:
#     http://www.ultra96.org/product/ultra96
# 
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2018 Avnet, Inc.
#                              All rights reserved.
# 
# ----------------------------------------------------------------------------
# 
#  Create Date:         Aug 17, 2018
#  Design Name:         Ultra96 Resize PYNQ Overlay Generator
#  Module Name:         build_everything_from_source.sh
#  Project Name:        Ultra96 Resize PYNQ Overlay Generator
#  Target Devices:      Xilinx Zynq UltraScale+
#  Hardware Boards:     Ultra96
# 
#  Tool versions:       Xilinx Vivado & Vivado HLS 2017.4
# 
#  Description:         Build Script for Ultra96 PYNQ Overlay
# 
#  Dependencies:        None
#
#  Revision:            Aug 17, 2018: 1.00 Initial version
# 
# ----------------------------------------------------------------------------

#!/bin/bash

# Remove any existing project files.

# First build and export the Resize HLS IP
cd resize/hls/
vivado_hls resize/hls_script.tcl

# Copy new exported IP to the location where Vivado can pick it up as an IP
# repository.
cp -R hls_proj/solution1/impl/ip ../

# Build Vivado design with newly exported Resize HLS IP core
cd ../overlays/
vivado -mode batch -source resize.tcl


