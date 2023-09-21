
.PHONY: all
all:
	$(MAKE) -C lib/github.com/diku-dk/sml-cstring all

.PHONY: test
test:
	$(MAKE) -C lib/github.com/diku-dk/sml-cstring test

.PHONY: clean
clean:
	$(MAKE) -C lib/github.com/diku-dk/sml-cstring clean
	rm -rf MLB *~ .*~
