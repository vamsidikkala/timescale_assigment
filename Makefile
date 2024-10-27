MODULE_big = median
EXTENSION = median
DATA = median--1.0.sql
DOCS = README.md
EXTRA_CLEAN = *~ median.tar.gz
REGRESS := median array bit boolean byte char datetime enum inet monetary \
           numeric textsearch uuid numeric_boundary bit_boundary byte_boundary \
           char_boundary inet_boundary monetary_boundary uuid_boundary \
           numeric_mean datetime_mean money_mean    
PG_USER = postgres
PGPORT=5433
REGRESS_OPTS := \
	--load-extension=$(EXTENSION) \
	--user=$(PG_USER) \
	--inputdir=test \
	--outputdir=test \
	--temp-instance=${PWD}/tmpdb

SRCS = median.c
OBJS = $(patsubst %.c,%.o,$(SRCS))
TARBALL = timescaledb-coding-assignment.tar.gz
#debug
PG_CFLAGS += -O0
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

.PHONY: tarball

$(TARBALL): $(SRCS) Makefile README.md median--1.0.sql test/sql/median.sql test/expected/median.out median.control
	tar -zcvf $@ --transform 's,^,timescaledb-coding-assignment/,' $^

tarball: $(TARBALL)
