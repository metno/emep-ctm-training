include ../Makefile

help:
	@echo "__Study the Portugal/Iberian 2017 wild fires__"
	@echo
	@echo "Create Initial/Boundary conditions fo the October wild fires"
	@echo
	@echo "Wild fires"
	@echo "  - 17–18 June, Portugal"
	@echo "  - 13–18 October, Portugal and Spain"
	@echo
	@echo "Meteorology"
	@echo "  - MACC14: operational IFS 00UTC, 0.25x0.125 deg LL"
	@echo
	@echo "Boundary conditions"
	@echo "  - CIFS: operational cIFS 00UTC, 0.4x0.4 deg LL"
	@echo
	@echo "Initial condictions"
	@echo "  - IRA00: CAMS50 Interim ReAanalysis (MACC14/CIFS 00UTC meteo/BCs)"
	@echo
	@echo "TODO"
	@echo "  - Setup subdomain run for the October fires"
	@echo "  - Setup nested (IC/BC) input and output"
	@echo "  - Reduce output"

setup: $(PROG)
	mkdir -p $(WORK)
	ln -nsf $(WORK) $(EXDIR)/work

$(PROG): $(SOURCE)/Makefile
	make -j6 -C $(SOURCE) PROG=$(PROG)

$(SOURCE)/Makefile:
	$(CLONE)
	$(BRANCH)

ifeq ($(wildcard ICBC_201710.nml),)
hint:
	@echo "Create a configuration file in $(EXDIR)",
	@echo "unsing $(EXDIR)/tempate.nml as a template"
	@echo
	@echo "Name your config file as follows"
	@echo " ICBC_201710.nml"
cheat:
	cp template.nml ICBC_201710.nml
else ifeq ($(shell grep '2017,10,31' *_201710.nml),)
hint:
	@echo "Set time period to October 2017"
	@echo
	@echo "change the following lines"
	@echo "  startdate = 2015,01,01,00,"
	@echo "  enddate   = 2017,12,31,24,"
	@echo "to"
	@echo "  startdate = 2017,10,01,00,"
	@echo "  enddate   = 2017,10,31,21,"
cheat:
	sed -i 's:2015,01,01,00:2017,10,01,00:' *_201710.nml
	sed -i 's:2015,12,31,24:2017,10,31,21:' *_201710.nml
else ifeq ($(shell grep 'GRID.*=.*MACC14' *_201710.nml),)
hint:
	@echo "Set the GRID for MACC14 meteo"
	@echo
	@echo "change the folloing line"
	@echo "  GRID      = 'EECCA',"
	@echo "to"
	@echo "  GRID      = 'MACC14',"
cheat:
	sed -i "s:\(GRID.*= *\).*,:\1'MACC14',:"  *_201710.nml
else ifeq ($(shell grep 'RUNDOMAIN.*=.*50,150,0,160' *_201710.nml),)
hint:
	@echo "Set a subdomain covering the Iberian peninsula"
	@echo
	@echo "for MACC14 domain change the folloing line"
	@echo "  RUNDOMAIN = -999,-999,-999,-999,"
	@echo "to"
	@echo "  RUNDOMAIN = 50,150,0,160,"
cheat:
	sed -i 's:\(RUNDOMAIN.*= *\).*,:\150,150,0,160,:' *_201710.nml
else ifeq ($(shell grep "^ *MODE_READ.*=.*'NHOUR'" *_201710.nml),)
hint:
	@echo "Set MODE_READ to 'NHOUR'"
	@echo
	@echo "change the folloing lines"
	@echo "  MODE_READ = 'NONE',         ! do nothing"
	@echo "! MODE_READ = 'NHOUR',        ! every NHOURREAD"
	@echo "to"
	@echo "! MODE_READ = 'NONE',         ! do nothing"
	@echo "  MODE_READ = 'NHOUR',        ! every NHOURREAD"
cheat:
	sed -i "s:^.\( * MODE_READ\):!\1:"  *_201710.nml
	sed -i "s:^.\( * MODE_READ.*=.*NHOUR\): \1:"  *_201710.nml
else ifeq ($(shell grep "^ *MODE_SAVE.*=.*'NHOUR'" *_201710.nml),)
hint:
	@echo "Set MODE_SAVE to 'NHOUR'"
	@echo
	@echo "change the folloing lines"
	@echo "  MODE_SAVE = 'NONE',         ! do nothing"
	@echo "! MODE_SAVE = 'NHOUR',        ! every NHOURSAVE"
	@echo "to"
	@echo "! MODE_SAVE = 'NONE',         ! do nothing"
	@echo "  MODE_SAVE = 'NHOUR',        ! every NHOURSAVE"
cheat:
	sed -i "s:^.\( * MODE_SAVE\):!\1:"  *_201710.nml
	sed -i "s:^.\( * MODE_SAVE.*=.*NHOUR\): \1:"  *_201710.nml
else ifneq ($(shell grep "^! *NHOUR.*=" *_201710.nml),)
hint:
	@echo "Set NHOURREAD and NHOURSAVE to 3 hours"
	@echo
	@echo "change the folloing lines"
	@echo "! NHOURREAD = 1,              ! hours between reads. Fraction of 24"
	@echo "! NHOURSAVE = 3,              ! hours between saves. Fraction of 24"
	@echo "to"
	@echo "  NHOURREAD = 3,              ! hours between reads. Fraction of 24"
	@echo "  NHOURSAVE = 3,              ! hours between saves. Fraction of 24"
cheat:
	sed -i "s:^.\( * NHOUR.*= *\).*,: \13,:"  *_201710.nml
else ifeq ($(shell grep "^ *template_read_3D.*=.*IRA00_YYYYMMDD.nc" *_201710.nml),)
hint:
	@echo "Set nest/IC to IRA00"
	@echo
	@echo "change the folloing line"
	@echo "  template_read_3D = 'EMEP_IN.nc',"
	@echo "to"
	@echo "  template_read_3D = 'DataDir/ffire_pt2017/IRA00_YYYYMMDD.nc',"
cheat:
	sed -i "s:.\(.*template_read_3D.*=\).*: \1 'DataDir/ffire_pt2017/IRA00_YYYYMMDD.nc',:" *_201710.nml
else ifeq ($(shell grep "^ *template_read_BC.*=.*hYYYYMMDD00_raqbc_d00.nc" *_201710.nml),)
hint:
	@echo "Set nest/BC to CIFS"
	@echo
	@echo "change the folloing line"
	@echo "  template_read_BC = 'EMEP_IN.nc',"
	@echo "to"
	@echo "  template_read_BC = 'DataDir/ffire_pt2017/hYYYYMMDD00_raqbc_d00.nc',"
cheat:
	sed -i "s:.\(.*template_read_BC.*=\).*: \1 'DataDir/ffire_pt2017/hYYYYMMDD00_raqbc_d00.nc',:" *_201710.nml
else ifeq ($(shell grep "^ *template_write.*=.*PTBC_YYYYMMDD.nc" *_201710.nml),)
hint:
	@echo "Set nest output file"
	@echo
	@echo "change the folloing line"
	@echo "  template_write   = 'EMEP_OUT.nc',"
	@echo "to"
	@echo "  template_write   = 'DataDir/ffire_pt2017/PTBC_YYYYMMDD.nc',"
cheat:
	sed -i "s:.\(.*template_write.*=\).*: \1 'PTBC_YYYYMMDD.nc',:" *_201710.nml
else ifeq ($(shell grep "^ *out_DOMAIN.*=.*70,130,40,120" *_201710.nml),)
hint:
	@echo "Set nest output domain"
	@echo
	@echo "change the folloing line"
	@echo "! out_DOMAIN     = 0,100,0,100,"
	@echo "to"
	@echo "  out_DOMAIN     = 70,130,40,120,"
cheat:
	sed -i "s:.\(.*out_DOMAIN.*=\).*: \1 70,130,40,120,:" *_201710.nml
else ifeq ($(shell grep "^ *TOP_BC.*=.*T" *_201710.nml),)
hint:
	@echo "Configure external BICs"
	@echo
	@echo "change the folloing lines"
	@echo "  USE_EXTERNAL_BIC  = F,"
	@echo "  EXTERNAL_BIC_NAME = 'DUMMY',"
	@echo "to"
	@echo "  USE_EXTERNAL_BIC     = T,"
	@echo "  EXTERNAL_BIC_NAME    = 'MACC_ENS',"
	@echo "  EXTERNAL_BIC_VERSION = 'IFS_CMP_g4e2',"
	@echo "  TOP_BC               = T,"
cheat:
	sed -i "s:.\(.*USE_EXTERNAL_BIC.*=\).*: \1 T,:" *_201710.nml
	sed -i "s:.\(.*EXTERNAL_BIC_NAME.*=\)..*: \1 'MACC_ENS',:" *_201710.nml
	sed -i "s:\( *\)\(EXTERNAL_BIC_NAME.*\):\1\2\n\1EXTERNAL_BIC_VERSION = 'IFS_CMP_g4e2',\n\1TOP_BC = T,:" *_201710.nml
else ifeq ($(shell grep "^ *description *= *'MACC_ENS' *, *'IFS_CMP_g4e2' *, *24" *_201710.nml),)
hint:
	@echo "Add external BICs mapping"
	@echo
	@echo "add the following namlist to your configuration"
	@cat .ExternalBICs_bc.nml
cheat:
	sed -i -e 'N;/TOP_BC.*&end/r .ExternalBICs_bc.nml' *_201710.nml
else ifneq ($(shell sed -n "/&OutputConcs_config/,/&end/p" *_201710.nml | wc -l),2)
hint:
	@echo "Remove unnecessary output"
	@echo
	@echo "Cleanup until OutputConcs_conf looks like"
	@echo "&OutputConcs_config"
	@echo "&end"
cheat:
	sed -i '/&OutputConcs_config/,/&end/{//!d}' *_201710.nml 
else ifneq ($(shell sed -n "/&OutputDep_config/,/&end/p" *_201710.nml | wc -l),2)
hint:
	@echo "Remove unnecessary output"
	@echo
	@echo "Cleanup until OutputDeå_conf looks like"
	@echo "&OutputDep_config"
cheat:
	sed -i '/&OutputDep_config/,/&end/{//!d}' *_201710.nml 
else ifeq ($(wildcard $(WORK)/*_201710/*.out),)
hint:
	@echo "You're ready to run the model"
	@echo
	@echo "Run the job script"
	@echo "  $(EXDIR)/run.job"
	@echo
	@echo "... ad see them on the queue"
	@echo "  squeue -u\$$USER -n icbc_pt2017"
cheat:
	$(EXDIR)/run.job
	watch -n15 "squeue -u$(USER) -n icbc_pt2017"
else
hint:
	@echo "Contratulations you completed this exercise!"
	@echo "  check the your run output at $(EXDIR)/work"
	@echo
	@echo "It can take up to 40 min for this run to complete."
	@echo "In the meantime, take minute and answer the followup questions"
	@echo "- Open the job script $(EXDIR)/run.job"
	@echo "  - How does it work?"
	@echo "  - What do you need to create IC/BCs for the June wild fires?"
	@echo "  - Why 3 different configurations for June?"
	@echo
	@echo "... and continue with the next exercise"
	@echo
	@echo "List the exercises with"
	@echo "  module avail course/exercise"
cheat: hint
endif
