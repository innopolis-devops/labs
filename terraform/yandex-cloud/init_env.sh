#!/usr/bin/env bash

YC_TOKEN=$(yc iam create-token)
YC_CLOUD_ID=$(yc config get cloud-id)
YC_FOLDER_ID=$(yc config get folder-id)

export YC_TOKEN
export YC_CLOUD_ID
export YC_FOLDER_ID
