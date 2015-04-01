ifdef VARS_FILE
VARS_FILES += ${VARS_FILE} vars_c2cgp_minimal2.yaml
else
VARS_FILE = vars_c2cgp_minimal2.yaml
VARS_FILES += ${VARS_FILE}
endif

APACHE_VHOST ?= c2cgp_minimal2

include CONST_Makefile
