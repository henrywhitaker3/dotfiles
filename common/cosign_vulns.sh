#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: cosign-vulns [image]"
    exit 1
fi

cosign download attestation --predicate-type vuln "$1" |
    jq -r '.dsseEnvelope.payload' |
    base64 -d |
    jq '.predicate.scanner.result.Results[] | {Target, Vulns: [.Vulnerabilities[]? | {VulnerabilityID, PkgName, Severity, InstalledVersion, FixedVersion}]}'
