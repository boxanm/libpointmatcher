#!/bin/bash -i
#
# Docker entrypoint for running libpointmatcher installer
#
# Usage:
#   $ bash entrypoint_execute_lpm_unittest.bash [<any-cmd>]
#
# Parameter
#   <any-cmd>      Optional command executed in a subprocess at the end of the entrypoint script.
#

# ....Load environment variables from file.........................................................................
set -o allexport
source ../.env
set +o allexport

# ==== Build libpointmatcher checkout branch ======================================================================
source lpm_install_libpointmatcher_ubuntu.bash \
  --libpointmatcher-version ${LIBPOINTMATCHER_VERSION:?'err variable not set'} \
  --cmake-build-type ${LIBPOINTMATCHER_CMAKE_BUILD_TYPE} \
  ${LIBPOINTMATCHER_INSTALL_SCRIPT_FLAG}

# ====Continue=====================================================================================================
exec "$@"