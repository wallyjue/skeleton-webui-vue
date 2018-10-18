#!/bin/bash

echo "window.configuration = { \"MES.API\": \"${MES_API}\", \"MES.APIVersion\": \"${MES_APIVersion}\", \"MRS.API\": \"${MRS_API}\", \"MRS.APIVersion\": \"${MRS_APIVersion}\", \"CncLegacyCore.API\": \"${CNCLegacyCore_API}\", \"CncLegacyCore.APIVersion\": \"${CNCLegacyCore_APIVersion}\" } " > config.js;

# Replace environment variables with values in nginx config
envsubst '${Catalog_UI} ${Model_UI}' < ../etc/nginx/nginx.conf > tempfile && cat tempfile > ../etc/nginx/nginx.conf && rm tempfile

nginx -g "daemon off;"