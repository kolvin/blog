help:
	@printf "Usage: make [target] [VARIABLE=value]\nTargets:\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install pre-commit hooks
	@pre-commit install
	@cd app; pnpm install

uninstall: ## Uninstall hooks
	@pre-commit uninstall

build: ## Build src
	@cd app; pnpm run build

run: ## Run dev project
	@cd app; pnpm dev

preview: ## Preview complied site 
	@make -s build
	@cd app; pnpm --silent preview

expose-preview: ## Expose preview site publiclly via ngrok
	@ngrok http 3000
