help:
	@printf "Usage: make [target] [VARIABLE=value]\nTargets:\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install pre-commit hooks
	@pre-commit install

uninstall: ## Uninstall hooks
	@pre-commit uninstall

build: ## Build src
	@pnpm run build

run: ## Run project
	@pnpm dev

preview: ## Preview complied site 
	@make -s build
	@pnpm preview

ngrok-expose: ## Expose complied site publiclly via ngrok
	@make -s preview
	@ngrok http 3000