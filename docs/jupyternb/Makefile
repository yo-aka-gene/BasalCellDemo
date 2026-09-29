PROJECT_ROOT := ../..
JUPYTER := $(PROJECT_ROOT)/.venv/bin/jupyter

PY_KERNEL := basalcelldemo_py
R_KERNEL := basalcelldemo_r

ENV_SUFFIX := $(shell hostname -s | sed 's/[^A-Za-z0-9._-]/_/g')
TEMPLATES := $(sort $(wildcard *_TEMPLATE.ipynb))

.PHONY: check-env check-templates execute

check-env:
	@test -x "$(JUPYTER)" || \
		(echo "ERROR: BasalCellDemo environment is not initialized."; \
		 echo "Run 'make init' at the repository root first."; \
		 exit 1)
	@$(JUPYTER) kernelspec list | grep -q "$(PY_KERNEL)" || \
		(echo "ERROR: Python kernel '$(PY_KERNEL)' is not installed."; exit 1)
	@$(JUPYTER) kernelspec list | grep -q "$(R_KERNEL)" || \
		(echo "ERROR: R kernel '$(R_KERNEL)' is not installed."; exit 1)

check-templates:
	@test -n "$(TEMPLATES)" || \
		(echo "ERROR: No *_TEMPLATE.ipynb files found."; exit 1)

execute: check-env check-templates
	@echo "Execution environment: $(ENV_SUFFIX)"
	@echo "Python kernel: $(PY_KERNEL)"
	@echo "R kernel: $(R_KERNEL)"
	@echo
	@set -eu; \
	for template in $(TEMPLATES); do \
		name=$${template%_TEMPLATE.ipynb}; \
		notebook="$${name}_$(ENV_SUFFIX).ipynb"; \
		case "$$template" in \
			*_r_TEMPLATE.ipynb) kernel="$(R_KERNEL)" ;; \
			*) kernel="$(PY_KERNEL)" ;; \
		esac; \
		echo "============================================================"; \
		echo "Template: $$template"; \
		echo "Output:   $$notebook"; \
		echo "Kernel:   $$kernel"; \
		echo "============================================================"; \
		cp -f "$$template" "$$notebook"; \
		ENV_SUFFIX="$(ENV_SUFFIX)" "$(JUPYTER)" nbconvert \
			--to notebook \
			--execute \
			--inplace \
			--ExecutePreprocessor.kernel_name="$$kernel" \
			--ExecutePreprocessor.timeout=-1 \
			"$$notebook"; \
		echo; \
	done
