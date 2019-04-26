include ../Makefile

help:
	@echo "__Study the Portugal/Iberian 2017 wild fires__"
	@echo
	@echo "Simulate the October wild fires with different meteo and forest fire emissions"
	@echo
	@echo "Wild fires"
	@echo "  - 17–18 June, Portugal"
	@echo "  - 13–18 October, Portugal and Spain"
	@echo
	@echo "Forest Fire Emissions"
	@echo "  - None"
	@echo "  - FINN daily"
	@echo "  - GFAS daily"
	@echo "  - GFAS1h horly (experimental)"
	@echo
	@echo "Meteorology"
	@echo "  - MACC14: operational IFS 00UTC, 0.25x0.125 deg LL"
	@echo "  - EECCA: mscw IFS run, 50x50 km PS"
	@echo
	@echo "TODO"
	@echo "  - Setup 2 day run for the June wild fires"
	@echo "  - Chose 4 combinations forest fire emissions and meteorology" 
	@echo "  - Run all 4 experiments at once"

setup: $(PROG)
	mkdir -p $(WORK)
	ln -nsf $(WORK) $(EXDIR)/work

$(PROG): $(SOURCE)/Makefile
	make -j6 -C $(SOURCE) PROG=$(PROG)

$(SOURCE)/Makefile:
	$(CLONE)
	$(BRANCH)

ifeq ($(wildcard *_*_201710.nml),)
hint:
	@echo "Create 4 different configuration files, unsing conf_201710.nml as a template"
	@echo
	@echo "Name your config files after the forest fire meission, meteoroloy and period"
	@echo "e.g. NONE_EECCA_201710.nml, FINN_EECCA_201710.nml, GFAS_MACC14_201710.nml, GFAS1h_MACC14_201710.nml"
cheat:
	cp conf_201710.nml NONE_EECCA_201710.nml
	cp conf_201710.nml FINN_EECCA_201710.nml
	cp conf_201710.nml GFAS_MACC14_201710.nml
	cp conf_201710.nml GFAS1h_MACC14_201710.nml
else ifneq ($(shell grep '2017,10,31' *_*_201710.nml),)
hint:
	@echo "Set time period to 13-18 June 2017"
	@echo
	@echo "change the following lines"
	@echo "  startdate = 2017,10,01,00,"
	@echo "  enddate   = 2017,10,31,21,"
	@echo "to"
	@echo "  startdate = 2017,10,13,00,"
	@echo "  enddate   = 2017,10,19,06,"
cheat:
	sed -i 's:2017,10,01,00:2017,10,13,00:' *_*_201710.nml
	sed -i 's:2017,10,31,21:2017,10,19,06:' *_*_201710.nml
else ifneq ($(shell grep 'GRID.*=.*MACC14' *_EECCA_201710.nml),)
hint:
	@echo "Set the GRID for EECCA runs"
	@echo
	@echo "change the folloing line"
	@echo "  GRID      = 'MACC14',"
	@echo "to"
	@echo "  GRID      = 'EECCA',"
cheat:
	sed -i 's:\(GRID.*=.*\)MACC14:\1EECCA:'  *_EECCA_201710.nml
else ifneq ($(shell grep 'RUNDOMAIN.*=.*50,150,0,160' *_EECCA_201710.nml),)
hint:
	@echo "Set a subdomain covering the Iberian peninsula"
	@echo
	@echo "for EECCA runs change the folloing line"
	@echo "  RUNDOMAIN = 50,150,0,160,"
	@echo "to"
	@echo "  RUNDOMAIN = 48,67,1,20,"
	@echo
	@echo "for MACC runs change the folloing line"
	@echo "  RUNDOMAIN = 50,150,0,160,"
	@echo "to"
	@echo "  RUNDOMAIN = 81,120,49,112,"
cheat:
	sed -i 's:\(RUNDOMAIN.*=.*\)50,150,0,160:\148,67,1,20:'  *_EECCA_201710.nml
	sed -i 's:\(RUNDOMAIN.*=.*\)50,150,0,160:\181,120,49,112:'  *_MACC14_201710.nml
else ifneq ($(shell grep "USES%FOREST_FIRES.*=.*F" FINN_*_201710.nml GFAS_*_201710.nml GFAS1h_*_201710.nml),)
hint:
	@echo "Use forest fires"
	@echo 
	@echo "for FINN, GFAS and GFAS1h runs change the folloing line"
	@echo " USES%FOREST_FIRES = F,"
	@echo "to"
	@echo " USES%FOREST_FIRES = T,"
cheat:
	sed -i "s:\(USES%FOREST_FIRES.*=.*\)F:\1T:" FINN_*_201710.nml GFAS_*_201710.nml GFAS1h_*_201710.nml
else ifneq ($(shell grep "USES%FOREST_FIRES.*=.*T" NONE_*_201710.nml),)
hint:
	@echo "Use forest fires"
	@echo 
	@echo "for NONE runs change the folloing line"
	@echo " USES%FOREST_FIRES = T,"
	@echo "to"
	@echo " USES%FOREST_FIRES = F,"
cheat:
	sed -i "s:\(USES%FOREST_FIRES.*=.*\)T:\1F:" NONE_*_201710.nml
else ifneq ($(shell grep "BBMAP.*=.*'FINN'" GFAS_*_201710.nml GFAS1h_*_201710.nml),)
hint:
	@echo "Set the biomass burning map"
	@echo 
	@echo "for GFAS and GFAS1h runs change the folloing line"
	@echo "  BBMAP = 'FINN',"
	@echo "to"
	@echo "  BBMAP = 'GFAS',"
cheat:
	sed -i "s:\(BBMAP.*=.*\)'FINN':\1'GFAS':" GFAS_*_201710.nml GFAS1h_*_201710.nml
else ifneq ($(shell grep "BBMAP.*=.*'GFAS'" FINN_*_201710.nml),)
hint:
	@echo "Set the biomass burning map"
	@echo 
	@echo "for FINN runs change the folloing line"
	@echo "  BBMAP = 'GFAS',"
	@echo "to"
	@echo "  BBMAP = 'FINN',"
cheat:
	sed -i "s:\(BBMAP.*=.*\)'GFAS':\1'FINN':" FINN_*_201710.nml
else ifneq ($(shell grep "^!.*GFAS_PATTERN.*GFAS1h" GFAS1h_*_201710.nml),)
hint:
	@echo "Set daily/hourly emission mode"
	@echo
	@echo "for GFAS1h runs change the folloing line"
	@echo "  GFAS_PATTERN='DataDir/ffire_pt2017/GFAS12_ForestFireEmis_YYYY.nc',"
	@echo "! GFAS_PATTERN='DataDir/ffire_pt2017/GFAS1h_ForestFireEmis_YYYYMM.nc',MODE='H',"
	@echo "to"
	@echo "! GFAS_PATTERN='DataDir/ffire_pt2017/GFAS12_ForestFireEmis_YYYY.nc',"
	@echo "  GFAS_PATTERN='DataDir/ffire_pt2017/GFAS1h_ForestFireEmis_YYYYMM.nc',MODE='H',"
cheat:
	sed -i 's:^ .*\(GFAS_PATTERN.*GFAS12\):!\1:' GFAS1h_*_201710.nml
	sed -i 's:^!.*\(GFAS_PATTERN.*GFAS1h\): \1:' GFAS1h_*_201710.nml
else ifneq ($(shell grep "^!.*GFAS_PATTERN.*GFAS12" GFAS_*_201710.nml),)
hint:
	@echo "Set daily/hourly emission mode"
	@echo
	@echo "for GFAS runs change the folloing line"
	@echo "! GFAS_PATTERN='DataDir/ffire_pt2017/GFAS12_ForestFireEmis_YYYY.nc',"
	@echo "  GFAS_PATTERN='DataDir/ffire_pt2017/GFAS1h_ForestFireEmis_YYYYMM.nc',MODE='H',"
	@echo "to"
	@echo "  GFAS_PATTERN='DataDir/ffire_pt2017/GFAS12_ForestFireEmis_YYYY.nc',"
	@echo "! GFAS_PATTERN='DataDir/ffire_pt2017/GFAS1h_ForestFireEmis_YYYYMM.nc',MODE='H',"
cheat:
	sed -i 's:^!.*\(GFAS_PATTERN.*GFAS12\): \1:' GFAS_*_201710.nml
	sed -i 's:^ .*\(GFAS_PATTERN.*GFAS1h\):!\1:' GFAS_*_201710.nml
else ifeq ($(wildcard $(EXDIR)/work),)
hint:
	@echo "You're almost ready to run the nodel"
	@echo
	@echo "To complete the setup you need to "
	@echo "- ensure you have the correct version of the model on the right path"
	@echo "- create a directory on the work/scratch section of $(MACHINE)"
	@echo
	@echo "... this was covered on a previous exersise so just use the setup command"
	@echo "  setup"
cheat: setup
else ifeq ($(wildcard $(WORK)/*_*_201710/Timing.out),)
hint:
	@echo "You're ready to run the model"
	@echo
	@echo "Run the job script"
	@echo "  $(EXDIR)/run.job"
	@echo
	@echo "... ad see them on the queue"
	@echo "  squeue -u\$USER -n ffire_pt2017"
cheat:
	$(EXDIR)/run.job
	watch -n15 "squeue -u$(USER) -n ffire_pt2017"
else
hint:
	@echo "Contratulations you completed this exercise!"
	@echo "  check the your run output at $(EXDIR)/work"
	@echo
	@echo "Take a minute and answer the followup questions"
	@echo "- Open the job script $(EXDIR)/run.job"
	@echo "  - How does it work?"
	@echo "  - What do you need to change to simulate the June wild fires?"
	@echo "- Open the ICBC_201710.nml configuration"
	@echo "  - What is diifferent from the template conf_201710.nml?"
	@echo "  - What does it do?"
	@echo "- Open the ICBC configurations for June ICBC_2017?.nml"
	@echo "  - Why 3 different configurations?"
	@echo "  - What do they do?"
	@echo
	@echo "... and continue with the next exercise"
	@echo
	@echo "List the exercises with"
	@echo "  module avail course/exercise"
cheat: hint
endif
