#! /bin/bash

if [[ "${COVERAGE}" == "Yes" ]] && [[ "${COVERITY_SCAN_BRANCH}" != "1" ]]; then
    # Creating report
    cd ${TRAVIS_BUILD_DIR}/build

    make coverage -j 2

    # Uploading report to CodeCov
    bash <(curl -s https://codecov.io/bash) -f ${TRAVIS_BUILD_DIR}/build/filtered.info || echo "Codecov did not collect coverage reports"
fi
