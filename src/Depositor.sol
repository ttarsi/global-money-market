// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.23;

import {XApp} from "omni/core/src/pkg/XApp.sol";
import {ConfLevel} from "omni/core/src/libraries/ConfLevel.sol";

import {IDepositor} from "src/interfaces/IDepositor.sol";
import {IAccountant} from "src/interfaces/IAccountant.sol";

/**
 * @title Depositor
 * @notice This contract lives on Arbitrum, Optimism, and Base. It receives user deposits and sends that data to the Accountant on the Omni EVM.
 */
contract Depositor is XApp {
    uint64 public constant DEST_TX_GAS_LIMIT = 120_000;

    address public accountant;

    constructor(address _accountant, address portal, uint8 defaultConf) XApp(portal, defaultConf) {
        accountant = _accountant;
    }
}
