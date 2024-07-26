// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.23;

interface IAccountant {
    event TokenAReceived(address indexed from, uint256 amount);
    event TokenBReceived(address indexed from, uint256 amount);

    function receiveTokenA(address user, uint256 amount) external;
    function receiveTokenB(address user, uint256 amount) external;
}
