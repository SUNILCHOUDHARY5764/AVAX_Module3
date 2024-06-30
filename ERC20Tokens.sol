// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ERC20_Token {
    address public owner;

    string public tokenName = "Token";
    string public tokenAbbrv = "TKN";
    uint256 public totalTokens =0;

    mapping (address => uint) public balances ;

    constructor() {
        owner = msg.sender;
        balances[msg.sender] = totalTokens;
    }

    function mintTokens(address account,uint amount) public {
        require(account==owner,"Only owner can mint tokens");
        totalTokens += amount;
        balances[account]+= amount;
    }

    function burnTokens(uint amount) public {
        require(balances[msg.sender]>=amount,"Unsufficent Balance");
        totalTokens -= amount;
        balances[msg.sender] -= amount;
    }

    function transferTokens(address account,uint amount) public {
        require(balances[msg.sender] >= amount, "Unsufficient balance");
        balances[msg.sender] -= amount;
        balances[account] += amount;
    }

}