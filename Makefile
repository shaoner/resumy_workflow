# Options
RESUME_NAME ?= resume
LANGUAGE ?= en
BUILD_DIR ?= out
RESUMY ?= resumy

# Internal variables
RESUME_TARGET ?= $(BUILD_DIR)/$(LANGUAGE)/$(RESUME_NAME).pdf

display_info = @echo -e "[\E[32;01m*\E[0m]$(1)"

all: $(RESUME_TARGET)

$(RESUME_TARGET): me.$(LANGUAGE).yaml
	mkdir -p $(dir $@)
	$(call display_info, "Create $@ from $< with language $(LANGUAGE)")
	$(RESUMY) build $< -o $@
	$(call display_info, "Successfully created $@")

clean:
	@rm -rf out
