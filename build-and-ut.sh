#!/bin/bash
#
# This script is a non-Maven way of building and testing the unit tests.
#
# Copyright (c) 2022 Open Technologies for Integration
# Licensed under the MIT license (see LICENSE for details)
#

# Create the work directory
mqsicreateworkdir /tmp/ace-demo-ut-work-dir

# Older commands for v11
#mqsipackagebar -w . -a /tmp/MyApplication.bar -k MyApplication -t MyApplication_UnitTest
#mqsibar -c -w /tmp/ace-demo-ut-work-dir -a /tmp/MyApplication.bar

# ibmint for v12
ibmint deploy --input-path . --output-work-directory /tmp/ace-demo-ut-work-dir --project TeaAvailabilityChecker --project TeaAvailabilityChecker_Working_Test

# Run the server to run the tests
IntegrationServer -w /tmp/ace-demo-ut-work-dir --start-msgflows false --no-nodejs --admin-rest-api -1 --test-project TeaAvailabilityChecker_Working_Test