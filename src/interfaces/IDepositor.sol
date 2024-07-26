// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.23;

interface IDepositor {
    event TokenALent(address user, uint256 amount);
    event TokenBLent(address user, uint256 amount);

    function lendTokenA(uint256 amount) external;
    function lendTokenB(uint256 amount) external;
}
