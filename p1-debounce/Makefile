PROJ   = blink
DEVICE = GW1NR-LV9QN88PC6/I5
FAMILY = GW1N-9C
SRC    = src/top.v
CST    = constr/tangnano9k.cst

all: $(PROJ).fs

$(PROJ).json: $(SRC)
	yosys -p "read_verilog $(SRC); synth_gowin -top top -json $@"

$(PROJ)_pnr.json: $(PROJ).json
	nextpnr-himbaechel --json $< --write $@ \
	  --device "$(DEVICE)" --vopt family=$(FAMILY) --vopt cst=$(CST)

$(PROJ).fs: $(PROJ)_pnr.json
	gowin_pack -d $(FAMILY) -o $@ $<

prog: $(PROJ).fs
	openFPGALoader -b tangnano9k $(PROJ).fs

clean:
	rm -f $(PROJ).json $(PROJ)_pnr.json $(PROJ).fs