include ../Makefile

help:
	@echo "Study the Portugal/Iberian 2017 wild fires"
	@echo "Simulate the October wild fires with different meteo and forest fire emissions"
	@echo
	@echo "Wild fires"
	@echo "  - 17–18 June, Portugal"
	@echo "  - 13–18 October, Portugal and Spain"
	@echo
	@echo "Emissions"
	@echo "  - None"
	@echo "  - FINN daily"
	@echo "  - GFAS daily"
	@echo "  - GFAS horly (experimental)"
	@echo
	@echo "Meteorology"
	@echo "  - MACC14: operational IFS 00UTC, 0.25x0.125 deg LL"
	@echo "  - EECCA: mscw IFS run, 50x50 km PS"
	@echo
	@echo "TODO"
	@echo "  - Setup 2 day run for the June wild fires"
	@echo "  - Chose 4 combinations forest fire emissions and meteorology" 
	@echo "  - Run all 4 experiments at once"

setup:
	mkdir -p $(WORK)
	ln -nsf $(WORK) $(EXDIR)/work
