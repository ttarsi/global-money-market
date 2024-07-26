ifneq (,$(wildcard ./.env))
    include .env
    export
endif

ensure-deps:
	@which omni > /dev/null 2>&1 || { \
		echo "Binary `omni` not found. Installing..."; \
		curl -sSfL https://raw.githubusercontent.com/omni-network/omni/main/scripts/install_omni_cli.sh | sh -s; \
	}

build:
	forge build

devnet-start:
	omni devnet start

devnet-clean:
	omni devnet clean

deploy:
	forge script DeployAccountant --broadcast --rpc-url $(OMNI_RPC_URL) --private-key $(PRIVATE_KEY)
	forge script DeployDepositor --broadcast --rpc-url $(OP_RPC_URL) --private-key $(PRIVATE_KEY)
	forge script DeployDepositor --broadcast --rpc-url $(ARB_RPC_URL) --private-key $(PRIVATE_KEY)
