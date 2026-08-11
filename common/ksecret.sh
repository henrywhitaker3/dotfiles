#!/bin/bash

output=$(</dev/stdin)

kind=$(echo "$output" | yq -r '.kind')
if [[ "$kind" != "Secret" ]]; then
    echo "Can noly parse secrets"
    exit 1
fi

echo "$output" | yq '
    with(select(.data != null);
        .stringData = ((.stringData // {}) * (.data | map_values(@base64d))) |
        del(.data)
    )
'
