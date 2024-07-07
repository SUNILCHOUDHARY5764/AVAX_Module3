// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC20_Token is ERC20, Ownable {
    uint256 public totalTokens = 0;

    mapping(address => uint256) public balances;

    constructor() ERC20("Token", "TKN") Ownable(msg.sender) {}

    function mintTokens(address account, uint256 amount) public onlyOwner {
        require(account==msg.sender,"Only owner can mint tokens");
        totalTokens += amount;
        balances[account]+= amount;
    }

    function burnTokens(uint256 amount) public {
        require(balances[msg.sender]>=amount,"Isufficent Balance");
        totalTokens -= amount;
        balances[msg.sender] -= amount;
    }

    function transferTokens(address account, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Unsufficient balance");
        balances[msg.sender] -= amount;
        balances[account] += amount;
    }
}
