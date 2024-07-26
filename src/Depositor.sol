// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.23;

import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

import {XApp} from "omni/core/src/pkg/XApp.sol";
import {ConfLevel} from "omni/core/src/libraries/ConfLevel.sol";

import {IDepositor} from "src/interfaces/IDepositor.sol";
import {IAccountant} from "src/interfaces/IAccountant.sol";

/**
 * @title Depositor
 * @dev This contract lives on Arbitrum, Optimism, and Base. It receives user deposits and sends that data to the Accountant on the Omni EVM.
 */
contract Depositor is XApp {
    uint64 public constant DEFAULT_GAS_LIMIT = 200_000;

    IAccountant public accountant;

    IERC20 public tokenA;
    IERC20 public tokenB;

    uint256 tokenABalance;
    uint256 tokenBBalance;

    constructor(address portal, uint8 defaultConf, address _accountant, address _tokenA, address _tokenB)
        XApp(portal, defaultConf)
    {
        accountant = IAccountant(_accountant);
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
    }

    function lendTokenA(uint256 amount) external {
        require(amount > 0, "Depositor: 0 TokenA");

        tokenABalance += amount;
        bytes memory data = abi.encodeWithSelector(accountant.receiveTokenA.selector, msg.sender, amount);
        xcall(omni.omniChainId(), address(accountant), data, DEFAULT_GAS_LIMIT);

        tokenA.transferFrom(msg.sender, address(this), amount);
    }

    function lendTokenB(uint256 amount) external {
        require(amount > 0, "Depositor: 0 TokenB");

        tokenBBalance += amount;
        bytes memory data = abi.encodeWithSelector(accountant.receiveTokenB.selector, msg.sender, amount);
        xcall(omni.omniChainId(), address(accountant), data, DEFAULT_GAS_LIMIT);

        tokenB.transferFrom(msg.sender, address(this), amount);
    }
}
