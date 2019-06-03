#!/bin/bash -x
#
# Author: Matt Choppen
#
# Copyright: Kühne & Nagel 2017
#
# Description:
#
# Please create your publish commands here in the order they should run after
# rpm install or rpm upgrade.
#

chown wmd /apps/jda/swiftapp/isccustom.sh
chmod 0555 /apps/jda/swiftapp/isccustom.sh

su - wmd -c /apps/jda/swiftapp/isccustom.sh

exit 0