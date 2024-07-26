ifneq (,$(wildcard ./.env))
    include .env
    export
endif

build:
	forge build

deploy:
	forge script DeployAccountant --broadcast --rpc-url $(OMNI_RPC_URL) --private-key $(PRIVATE_KEY)
	forge script DeployDepositor --broadcast --rpc-url $(OP_RPC_URL) --private-key $(PRIVATE_KEY)
	forge script DeployDepositor --broadcast --rpc-url $(ARB_RPC_URL) --private-key $(PRIVATE_KEY)
