// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.23;

import {Script, console} from "forge-std/Script.sol";

import {Accountant} from "src/Accountant.sol";
import {ConfLevel} from "omni/core/src/libraries/ConfLevel.sol";

contract DeployAccountant is Script {
    function run() external {
        address portalAddress = vm.envAddress("PORTAL_ADDRESS");

        vm.startBroadcast();
        Accountant accountant = new Accountant(portalAddress, ConfLevel.Latest);
        vm.stopBroadcast();

        console.log("Deployed Accountant at:", address(accountant));
    }
}
