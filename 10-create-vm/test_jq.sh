#!/bin/bash
echo '{"resource_changes":[{"address":"a","change":{"actions":["delete"]}}]}' > /tmp/tfplan.json
RESOURCES_TO_DESTROY=$(jq -r '.resource_changes[] | select(.change.actions[] | contains("delete")) | .address' /tmp/tfplan.json)
echo "RESULT: $RESOURCES_TO_DESTROY"
