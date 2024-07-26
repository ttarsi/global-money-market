// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.23;

import {XApp} from "omni/core/src/pkg/XApp.sol";
import {ConfLevel} from "omni/core/src/libraries/ConfLevel.sol";

import {IDepositor} from "src/interfaces/IDepositor.sol";
import {IAccountant} from "src/interfaces/IAccountant.sol";

/**
 * @title Depositor
 * @notice A contract for transmitting greetings to the global chain
 * @dev This contract allows users to transmit greetings to a greeter contract deployed on the global chain via cross-chain communication.
 */
contract Depositor is XApp {
    uint64 public constant DEST_TX_GAS_LIMIT = 120_000;

    address public accountant;

    constructor(address _accountant, address portal, uint8 defaultConf) XApp(portal, defaultConf) {
        accountant = _accountant;
    }
}
