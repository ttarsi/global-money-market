// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.23;

import {Test} from "forge-std/Test.sol";

import {MockPortal} from "omni/core/test/utils/MockPortal.sol";

import {Depositor} from "src/Depositor.sol";
import {ConfLevel} from "omni/core/src/libraries/ConfLevel.sol";

contract DepositorTest is Test {
    Depositor depositor;
    MockPortal portal;
    
    address accountant;

    function setUp() public {
        accountant = address(0x123);
        portal = new MockPortal();
        depositor = new Depositor(accountant, address(portal), ConfLevel.Latest);
    }
}
