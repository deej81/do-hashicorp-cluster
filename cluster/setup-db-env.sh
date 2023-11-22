#!/bin/bash

# extract outputs into needed environment variables

export TF_VAR_postgres_uri=$(terraform output postgres_cluster_private_uri)