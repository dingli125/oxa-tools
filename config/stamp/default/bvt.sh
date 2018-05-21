#!/bin/bash

# Open edX configuration (server-vars.yml) can be tokenized such that variable expansion
# using oxa-tools-config environment configurations is possible. Note that defaults can
# be specified in the tokenized configuration. i.e., ${foo:-bar}
#
# see: http://www.tldp.org/LDP/abs/html/parameter-substitution.html

##########################
# ENVIRONMENT IDENTIFIER
##########################
ENVIRONMENT=bvt

##########################
# SITE URLS
##########################

# the site certificate files (.crt & .key) have to be named after the BASE_URL value
BASE_URL=nytraining.crf
LMS_URL=lms.$BASE_URL
CMS_URL=cms.$BASE_URL
PREVIEW_URL=preview.$BASE_URL

# deployment configuration
# URL-building will be replaced by the use of LMS_URL | CMS_URL (above)
# uri format: [lms|cms]-%%CLUSTERNAME%%-%%DEPLOYMENT_SLOT%%.%%REGION%%.cloudapp.chinacloudapi.cn
TEMPLATE_TYPE=stamp # stamp|fullstack|devstack
CLUSTERNAME=edxgroup
ADMIN_USER=lexoxaadmin
OXA_TOOLS_VERSION=oxa/master.fic

# config/server-vars.yml
#YOUTUBE_API_KEY=todo
PLATFORM_NAME="U课在线培训平台"
PLATFORM_EMAIL=dinglb@nysoftland.com.cn

# Override configured email addresses
EDXAPP_EMAIL_BUGS="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_BULK_FROM="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_CONTACT="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_FEEDBACK="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_DEFAULT_FROM="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_PAYMENT_SUPPORT="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_PRESS="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_TECH_SUPPORT="${PLATFORM_EMAIL}"
EDXAPP_EMAIL_UNIVERSITY="${PLATFORM_EMAIL}"

# config/versions.yml
CONFIGURATION_REPO=https://github.com/iovex/edx-configuration.git
CONFIGURATION_VERSION=oxa/master.fic
PLATFORM_REPO=https://github.com/iovex/edx-platform.git
PLATFORM_VERSION=oxa/master.fic
THEME_REPO=https://github.com/iovex/edx-theme.git
THEME_VERSION=oxa/master.fic
EDX_VERSION=open-release/ficus.master
FORUM_VERSION=open-release/ficus.master

# fullstack uses default EMAIL_HOST=localhost
# config/stamp/stamp.yml
EDXAPP_EMAIL_HOST=mail.nysoftland.com.cn
EDXAPP_EMAIL_HOST_USER=dinglb@nysoftland.com.cn
EDXAPP_EMAIL_HOST_PASSWORD=dlb@312
EDXAPP_EMAIL_PORT=25
EDXAPP_EMAIL_USE_TLS=true

# storage uploads
AZURE_ACCOUNT_NAME=edxgroupsecuresa
AZURE_ACCOUNT_KEY=xB0G9qvUygYssC3JOIdMCqIh8eIYPZJ6OgVhVPTxF+QblLg6cLFBKTamGY4q9otOYpLViNRCRRAJXFoG8XSYLQ==

NGINX_ENABLE_SSL=True
NGINX_SSL_CERTIFICATE="/oxa/oxa-tools-config/env/${ENVIRONMENT}/cert.crt"
NGINX_SSL_KEY="/oxa/oxa-tools-config/env/${ENVIRONMENT}/cert.key"

##########################
# MONGO
##########################

# Mongo Credentials
MONGO_USER=oxamongoadmin
MONGO_PASSWORD=5QFrMCIKJaVazBWisd0fMJR

# Mongo Replicaset Credentials
MONGO_REPLICASET_KEY=nptrnutnqemr2
MONGO_REPLICASET_NAME=edxgrouprs

# MongoDB Installer Configurations
MONGO_INSTALLER_SCRIPT=mongodb-ubuntu-install.sh
MONGO_INSTALLER_BASE_URL=http://repo.mongodb.org/apt/ubuntu
MONGO_INSTALLER_PACKAGE_NAME=mongodb-org
MONGO_SERVER_IP_PREFIX=10.0.0.
MONGO_SERVER_IP_OFFSET=10
MONGO_SERVER_LIST=10.0.0.11,10.0.0.12,10.0.0.13

##########################
# MYSQL
##########################

# Mysql Credentials
MYSQL_ADMIN_USER=oxamysqladmin
MYSQL_ADMIN_PASSWORD=5QFrMCIKJaVazBWisd0fMJR

# MySql Temporary Credentials
MYSQL_TEMP_USER=oxamysqlbackupuser
MYSQL_TEMP_PASSWORD=5QFrMCIKJaVazBWisd0fMJR

# App and Replication accounts (same account??)
# TODO: separate the replication user from the edxapp user
MYSQL_USER=oxamysqlrepluser
MYSQL_PASSWORD=5QFrMCIKJaVazBWisd0fMJR
MYSQL_REPL_USER=oxamysqlrepluser
MYSQL_REPL_USER_PASSWORD=5QFrMCIKJaVazBWisd0fMJR

# Mysql Installer Configurations
MYSQL_INSTALLER_SCRIPT=mysql-ubuntu-install.sh
MYSQL_PACKAGE_VERSION="5.6"
MYSQL_MASTER_IP=10.0.0.16
MYSQL_SERVER_LIST=10.0.0.16,10.0.0.17,10.0.0.18
MYSQL_MASTER_PORT=3306

# Superuser Information (this gives front door access to the application. This value must be updated.)
EDXAPP_SU_PASSWORD=5QFrMCIKJaVazBWisd0fMJR
EDXAPP_SU_EMAIL=dinglb@nysoftland.com.cn
EDXAPP_SU_USERNAME=edxappadmin

# Azure Active Directory OAuth2 Third Party Authentication Configuration
EDXAPP_ENABLE_THIRD_PARTY_AUTH=false
EDXAPP_AAD_CLIENT_ID="b5167625-06d4-4b70-ba17-d15149bc3b16"
EDXAPP_AAD_SECURITY_KEY="rt2q47Z5aWc7K5mHH2WfwbNwbEdzyX90y9qWKexWxns="
EDXAPP_AAD_BUTTON_NAME=""

# Comprehensive Theming Configuration
EDXAPP_ENABLE_COMPREHENSIVE_THEMING=false
EDXAPP_COMPREHENSIVE_THEME_DIRS=\[\ \"\"\ \]
EDXAPP_DEFAULT_SITE_THEME=""

COMBINED_LOGIN_REGISTRATION=true

# Import Kitchen Sink Course Configuration
EDXAPP_IMPORT_KITCHENSINK_COURSE=False

# Memcache server
# In order to support multiple VMSS resources, we have to support multiple memcache target servers to avoid collision of cache keys that result in 
# broken application experiences (cache poisoning). It is therefore necessary to add explicit configuration for the memcache server and allow 
# deployment-time overrides.
MEMCACHE_SERVER_IP=$MYSQL_MASTER_IP

# Conditionally enabling Mobile Rest Api in support of MPP integration scenarios
EDXAPP_ENABLE_OAUTH2_PROVIDER=true
EDXAPP_ENABLE_MOBILE_REST_API=true
OAUTH_ENFORCE_SECURE=true