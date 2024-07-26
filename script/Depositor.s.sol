// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.23;

import {Script, console} from "forge-std/Script.sol";

import {Depositor} from "src/Depositor.sol";
import {ConfLevel} from "omni/core/src/libraries/ConfLevel.sol";

contract DeployDepositor is Script {
    function run() external {
        address portal = vm.envAddress("PORTAL_ADDRESS");
        address accountant = vm.envAddress("ACCOUNTANT_ADDRESS");
        address tokenA = vm.envAddress("USDC_ADDRESS");
        address tokenB = vm.envAddress("WETH_ADDRESS");

        vm.startBroadcast();
        Depositor depositor = new Depositor(address(portal), ConfLevel.Latest, accountant, tokenA, tokenB);
        vm.stopBroadcast();

        console.log("Deployed Depositor at:", address(depositor));
    }
}
