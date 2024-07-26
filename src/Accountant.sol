// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.23;

import {XApp} from "omni/core/src/pkg/XApp.sol";
import {ConfLevel} from "omni/core/src/libraries/ConfLevel.sol";
import {IAccountant} from "src/interfaces/IAccountant.sol";

/**
 * @title Accountant
 * @dev This lives on the Omni EVM and tracks all deposits, withdrawals, and global interest rates.
 */
contract Accountant is IAccountant, XApp {
    mapping(address => uint256) public userTokenABalances;
    mapping(address => uint256) public userTokenBBalances;

    mapping(uint64 => uint256) public chainTokenABalances;
    mapping(uint64 => uint256) public chainTokenBBalances;

    uint256 public virtualTokenABalance;
    uint256 public virtualTokenBBalance;

    uint256 public AtoBInterestRate;
    uint256 public BtoAInterestRate;

    constructor(address portal, uint8 defaultConf) XApp(portal, defaultConf) {}

    function receiveTokenA(address user, uint256 amount) external xrecv {
        require(isXCall(), "Accountant: not xcall");

        userTokenABalances[user] += amount;
        chainTokenABalances[xmsg.sourceChainId] += amount;

        updateInterestRates();

        emit TokenAReceived(user, amount);
    }

    function receiveTokenB(address user, uint256 amount) external xrecv {
        require(isXCall(), "Accountant: not xcall");

        userTokenBBalances[user] += amount;
        chainTokenBBalances[xmsg.sourceChainId] += amount;

        updateInterestRates();

        emit TokenBReceived(user, amount);
    }

    function updateInterestRates() internal {}
}
