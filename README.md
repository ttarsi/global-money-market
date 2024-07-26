# Global Money Market

This is proof of concept of a money market that allows users to deposit from Arbitrum, Optimism, and Base, and tracks a global interest rate across all 3.

## Instructions

Note: you'll need to have docker installed.

1. Run `make ensure-deps` to ensure you've installed the `omni` cli.
2. Run `make build` to build the smart contracts.
3. Run `make devnet-start` to deploy a local instance of Omni, which includes local deployments of Omni, Arbitrum, and Optimism.
4. Run `make deploy` to deploy your smart contracts.

Congrats, your global money market is deployed.

When finished, you can run:

`make devnet-clean`

to shut down your local devnet.
