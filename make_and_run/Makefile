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
endif
