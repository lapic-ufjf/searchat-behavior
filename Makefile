.PHONY: all help \
	api-all ui-all \
	test test-api test-watch test-cov test-debug test-e2e \
	lint lint-check \
	check-copyright add-copyright

help:
	@echo "======================================================================"
	@echo "Available make targets:"
	@echo "======================================================================"
	@echo ""
	@echo "  make all              Run the default checks exposed by api and ui"
	@echo "  make help             Show this help message"
	@echo ""
	@echo "Service Aggregates:"
	@echo "  make api-all          Run api/Makefile default target"
	@echo "  make ui-all           Run the available ui/Makefile checks"
	@echo ""
	@echo "Testing Targets:"
	@echo "  make test             Run api tests"
	@echo "  make test-api         Run api tests (same as 'make test')"
	@echo "  make test-watch       Run api tests in watch mode"
	@echo "  make test-cov         Run api tests with coverage report"
	@echo "  make test-debug       Run api tests in debug mode"
	@echo "  make test-e2e         Run api end-to-end tests"
	@echo ""
	@echo "Shared Targets:"
	@echo "  make lint             Run lint target in api and ui"
	@echo "  make lint-check       Run lint-check target in api and ui"
	@echo ""
	@echo "  make check-copyright  Run check-copyright target in api and ui"
	@echo "  make add-copyright    Run add-copyright target in api and ui"
	@echo ""
	@echo "======================================================================"

all: api-all ui-all
	@echo "✅ All checks passed!"

api-all:
	@$(MAKE) -C api all

check-copyright:
	@$(MAKE) -C api check-copyright
	@$(MAKE) -C ui check-copyright

add-copyright:
	@$(MAKE) -C api add-copyright
	@$(MAKE) -C ui add-copyright

lint:
	@$(MAKE) -C api lint
	@$(MAKE) -C ui lint

lint-check:
	@$(MAKE) -C api lint-check
	@$(MAKE) -C ui lint-check

test-api:
	@$(MAKE) -C api test

test:
	@$(MAKE) -C api test

test-watch:
	@$(MAKE) -C api test-watch

test-cov:
	@$(MAKE) -C api test-cov

test-debug:
	@$(MAKE) -C api test-debug

test-e2e:
	@$(MAKE) -C api test-e2e

ui-all:
	@$(MAKE) -C ui lint-check
	@$(MAKE) -C ui check-copyright
