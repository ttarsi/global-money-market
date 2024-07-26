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
    address tokenA;
    address tokenB;

    function setUp() public {
        portal = new MockPortal();
        accountant = address(0x123);
        tokenA = address(0x456);
        tokenB = address(0x789);

        depositor = new Depositor(address(portal), ConfLevel.Latest, accountant, tokenA, tokenB);
    }
}
