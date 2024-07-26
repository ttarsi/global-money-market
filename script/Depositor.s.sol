// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.23;

import {Script, console} from "forge-std/Script.sol";

import {Depositor} from "src/Depositor.sol";
import {ConfLevel} from "omni/core/src/libraries/ConfLevel.sol";

contract DeployDepositor is Script {
    function run() external {
        address portalAddress = vm.envAddress("PORTAL_ADDRESS");
        address accountantAddress = vm.envAddress("ACCOUNTANT_ADDRESS");

        vm.startBroadcast();
        Depositor depositor = new Depositor(accountantAddress, portalAddress, ConfLevel.Latest);
        vm.stopBroadcast();

        console.log("Deployed Depositor at:", address(depositor));
    }
}
