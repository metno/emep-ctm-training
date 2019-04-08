

# check if HPC module is loaded
HOST = $(shell hostname -s)
ifneq "$(MACHINE)" "$(HOST)"
all: getstarted
else
all: help
endif

getstarted:
	@echo "Load the HPC environment module with the following commands"
	@echo "  module use $(PWD)/modulefiles/"
	@echo "  module load course/$(HOST)"

help:
	@echo "Each exercise has its own module, which defines the following commands"
	@echo "  help     short description of the exercise"
	@echo "  setup    set all the required files and links"
	@echo "  hint     more detailed description on what to do"
	@echo "  cheat    shows the solution of the exercise"
	@echo
	@echo "List the exercises with"
	@echo "  module avail course/exercise"
	@echo
	@echo "Load the first exercise with"
	@echo "  module load course/exercise/make_and_run"
