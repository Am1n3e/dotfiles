CONFIGS := nvim 

# Define the target directory where the stow command will create symlinks
TARGET := $(HOME)

# Default target
all: help

# Stow all configurations
stow:
	@for config in $(CONFIGS); do \
		echo "Stowing $$config into $(TARGET)..."; \
		stow --target=$(TARGET) $$config; \
	done

