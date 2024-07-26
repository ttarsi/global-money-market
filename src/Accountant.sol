// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.23;

import {XApp} from "omni/core/src/pkg/XApp.sol";
import {ConfLevel} from "omni/core/src/libraries/ConfLevel.sol";
import {IAccountant} from "src/interfaces/IAccountant.sol";

/**
 * @title Accountant
 * @notice This lives on the Omni EVM and tracks all deposits, withdrawals, and global interest rates.
 */
contract Accountant is XApp {
    constructor(address portal, uint8 defaultConf) XApp(portal, defaultConf) {}
}
