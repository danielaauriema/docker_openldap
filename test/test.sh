#!/bin/bash
set -e

if [ ! -f "./bash-test.sh" ]; then
  curl "https://raw.githubusercontent.com/danielaauriema/bash-tools/master/bash-test/bash-test.sh" > "./bash-test.sh"
  chmod ugo+rwx "./bash-test.sh"
fi

./bash-test.sh ./test-config.sh