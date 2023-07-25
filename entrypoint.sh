#!/bin/sh

set -e
echo "${KUBE_CONFIG_DATA}" | base64 -d > kubeconfig
#export KUBECONFIG="${PWD}/kubeconfig"
#chmod 600 "${PWD}/kubeconfig"
export KUBECONFIG=kubeconfig



echo "running kubectl command(s)"
response=$(/bin/sh -c "${INPUT_COMMAND}") 
echo "${response}"
{
  echo "response<<EOF";
  echo "$response";
  echo "EOF";
} >> "${GITHUB_OUTPUT}"
