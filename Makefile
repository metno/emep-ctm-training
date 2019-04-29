all: help

# check if HPC module is loaded
HOST = $(shell hostname -s)
ifeq (,$(findstring course/$(HOST)/make,$(LOADEDMODULES)))
help: getstarted
else ifeq (,$(findstring course/exercise,$(LOADEDMODULES)))
help: exercises commands
else
help: commands
endif

getstarted:
	@echo "Load the HPC environment module with the following commands"
	@echo "  module use ~/emep-ctm-training/modulefiles/"
	@echo "  module load course/$(HOST)"
	@echo
	@echo "For the next steps type"
	@echo "  help"
	@echo
	@echo "and follow the instructions"
	@echo

exercises:
	@echo "List the exercises with"
	@echo "  module avail course/exercise"
	@echo
	@echo "Each exercise has its own module, which defines the following commands"
	@echo "  help     short description of the exercise"
	@echo "  setup    set all the required files and links"
	@echo "  hint     more detailed description on what to do"
	@echo "  cheat    shows the solution of the exercise"
	@echo
	@echo "Load the first exercise with"
	@echo "  module load course/exercise/make_and_run"
	@echo
	@echo "Load the 2017 IC/BC exercise with"
	@echo "  module load course/exercise/icbc_pt2017"
	@echo
	@echo "Load the 2017 wildfires exercise with"
	@echo "  module load course/exercise/ffire_pt2017"
	@echo

commands:
	@echo "**Use the help and hint commands to progess trough the exercise**"
	@echo

clean:
	git clean -fXd

cleanall: clean
	rm -fr src/
