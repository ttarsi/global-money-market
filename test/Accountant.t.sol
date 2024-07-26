// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.23;

import {Test} from "forge-std/Test.sol";

import {MockPortal} from "omni/core/test/utils/MockPortal.sol";

import {Accountant} from "src/Accountant.sol";
import {ConfLevel} from "omni/core/src/libraries/ConfLevel.sol";

contract AccountantTest is Test {
    Accountant accountant;
    MockPortal portal;

    function setUp() public {
        portal = new MockPortal();
        accountant = new Accountant(address(portal), ConfLevel.Latest);
    }
}
