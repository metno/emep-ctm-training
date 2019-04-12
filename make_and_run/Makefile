include ../Makefile

help:
	@echo "Compile the model and run for a few time steps"
	@echo "  - get the source code for $(CTMTAG)"
	@echo "  - compile the model and copy the binary to $(PROG)" 
	@echo "  - change the configuration to run for 3 hours" 
	@echo "  - reduce the queue walltime to 15 minutes on the job script"
	@echo "  - submit the job script to the queue"

ifeq ($(wildcard $(SOURCE)/Makefile),)
hint:
	@echo "Clone the source branch from the open souce repository"
	@echo "  $(CLONE)"
	@echo
	@echo "Use the $(CTMTAG) tag to create a new branch"
	@echo "  $(BRANCH)"
cheat:
	$(CLONE)
	$(BRANCH)
else ifeq ($(wildcard $(PROG)),)
hint:
	@echo "Use the PROG variable on the $(SOURCE)/Makefile"
	@echo "  make -j6 -C $(SOURCE) PROG=$(PROG)"
cheat:
	make -j6 -C $(SOURCE) PROG=$(PROG)
else ifeq ($(wildcard $(WORK)),)
hint:
	@echo "Create a directory on the work/scratch section of $(MACHINE)"
	@echo "  mkdir -p $(WORK)"
	@echo
	@echo "Link $(WORK) to $(EXDIR)/work for use on the job script"
	@echo "  ln -nsf $(WORK) $(EXDIR)/work"
	@echo
	@echo "... or just use the setup command"
	@echo "  setup"
cheat: setup
else
hint:
	@echo "Modify the follwoing lines on the configuration file"
	@echo "  $(EXDIR)/config_emep.nml"
	@echo "from a yearly run"
	@echo "  startdate = 2015,01,01,00,"
	@echo "  enddate   = 2015,12,31,24,"
	@echo "to a 3 hour run"
	@echo "  startdate = 2015,01,01,00,"
	@echo "  enddate   = 2015,01,01,03,"
	@echo "set the default input path"
	@echo "  DataPath(1) = '../input',"
	@echo "to use the input already downloaded"
	@echo "  DataPath(1) = '$(DATA)/input',"
	@echo "set the default meteo path"
	@echo "  meteo = '../meteoYYYY/GRID/meteoYYYYMMDD.nc',"
	@echo "to use the meteo already downloaded"
	@echo "  meteo = '$(DATA)/meteoYYYY/GRID/meteoYYYYMMDD.nc',"
	@echo
	@echo "Modify the following line on the job file"
	@echo "  $(EXDIR)/run.job"
	@echo "  from a 2 hour run"
	@echo "#SBATCH --nodes=2 --ntasks-per-node=32 --time=02:00:00"
	@echo "  to a 15 mmin run"
	@echo "#SBATCH --nodes=2 --ntasks-per-node=32 --time=00:15:00"
	@echo
	@echo "Run the job script and check its progress"
	@echo "  $(EXDIR)/run.job && tail -F $(EXDIR)/run.out"
cheat:
	sed -i 's/time=..:..:../time=00:15:00/'  $(EXDIR)/run.job
	sed -i 's/\(enddate.*=.*....\),..,..,..,/\1,01,01,03,/'  $(EXDIR)/config_emep.nml
	sed -i 's:\.\./input:$(DATA)/input:'  $(EXDIR)/config_emep.nml
	sed -i 's:\.\./meteo:$(DATA)/meteo:'  $(EXDIR)/config_emep.nml
	$(EXDIR)/run.job && tail -F $(EXDIR)/run.out
endif

setup:
	mkdir -p $(WORK)
	ln -nsf $(WORK) $(EXDIR)/work
