FILES := $(wildcard *.typ)
all:
	$(MAKE) compile

$(FILES:.typ=.svg): %.svg: %.typ
	@echo "Compiling $< to $@"
	@typst compile --format svg $< $@

compile: $(FILES:.typ=.svg)

clean:
	@rm *.svg
