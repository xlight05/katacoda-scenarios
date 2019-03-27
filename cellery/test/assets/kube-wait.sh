#!/usr/bin/env bash

set -e

function __is_pod_ready() {
  [[ "$(kubectl get po "$1" -n cellery-system -o 'jsonpath={.status.conditions[?(@.type=="Ready")].status}')" == 'True' ]]
}

function __pods_ready() {
  local pod

  [[ "$#" == 0 ]] && return 0

  for pod in $pods; do
    __is_pod_ready "$pod" || return 1
  done

  return 0
}

function __wait-until-pods-ready() {
  local period interval i pods

  period=10000000000
  interval=5

  for ((i=0; i<$period; i+=$interval)); do
    pods="$(kubectl get po -n cellery-system -o 'jsonpath={.items[*].metadata.name}')"
    if __pods_ready $pods; then
      return 0
    fi
    sleep "$interval"
  done

  return 1
}

__wait-until-pods-ready
# vim: ft=sh :
