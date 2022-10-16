#!/bin/bash

check_config() {
  if [ -z ${XRAY_DOMAIN} ]; then
    echo "Please set XRAY_DOMAIN variable"
    exit 1
  fi

  if [ -z ${XRAY_UUID} ]; then
    echo "Please set XRAY_UUID variable"
    exit 1
  fi

  if [ -z ${XRAY_WS_PATH} ]; then
    echo "Please set XRAY_WS_PATH variable"
    exit 1
  fi

  if [ -z ${XRAY_EMAIL} ]; then
    echo "Please set XRAY_EMAIL variable"
    exit 1
  fi
}

generate_config_file() {
  local file="$1"

  if [ ! -e "${file}.example" ]; then
    echo "config ${file}.example not exist"
    exit 1
  fi

  cp "${file}.example" "${file}"
  sed -i 's#user-domain#'$XRAY_DOMAIN'#g' "${file}"
  sed -i 's#user-uuid#'$XRAY_UUID'#g'     "${file}"
  sed -i 's#user-path#'$XRAY_WS_PATH'#g'  "${file}"
  sed -i 's#user-email#'$XRAY_EMAIL'#g'  "${file}"
}

generate_config() {
  generate_config_file "config.json"
  generate_config_file "vless-ws-tls.json"
  generate_config_file "vless-xtls.json"
}

clean_config() {
  rm -f config.json vless-ws-tls.json vless-xtls.json
}

usage() {
  echo "Usage: gen-xray-config.sh [clean]"
  echo ""
  echo "Command:"
  echo "   clean            clean generated configuration"
  echo ""
  echo "Please set the following environment variables"
  echo "   XRAY_DOMAIN      your domain"
  echo "   XRAY_EMAIL       your email"
  echo "   XRAY_UUID        uuid using by xray"
  echo "   XRAY_WS_PATH     url path using by websocket"
}

main() {
  if [ "$1" == "clean" ]; then
    clean_config
    return 0
  fi
  check_config
  generate_config
}

main $@
