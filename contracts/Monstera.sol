// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

import "hardhat/console.sol";

contract Monstera is ERC20("Monstera", "MTR"), ERC20Burnable, Ownable {
    uint256 private cap = 50_000_000_000 * 10**uint256(18); 

    constructor() Ownable(msg.sender) {
        console.log('Owner: %s - Capacity: %s', msg.sender, cap);
        _mint(msg.sender, cap); // mint all tokens to owner
        transferOwnership(msg.sender);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(ERC20.totalSupply() + amount <= cap, "Monstera: cap exceeded");
        _mint(to, amount);
    }
}