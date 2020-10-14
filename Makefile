MIX = mix

ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS += -I$(ERLANG_PATH)
CFLAGS += -I trezor 


ifneq ($(OS),Windows_NT)
	CFLAGS += -fPIC

	ifeq ($(shell uname),Darwin)
		LDFLAGS += -dynamiclib -undefined dynamic_lookup
	endif
endif

.PHONY: clean

all: priv/libnewchain_nif.so

priv/libnewchain_nif.so: c_src/libnewchain_nif.c
	$(CC) $(CFLAGS) -shared -o $@ c_src/libnewchain_nif.c c_src/trezor/*.c $(LDFLAGS)

clean:
	$(MIX) clean
	$(RM) priv/libnewchain_nif.so
