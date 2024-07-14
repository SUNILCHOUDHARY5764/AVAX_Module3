// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ERC20_Tokens is ERC20, ERC20Burnable, Ownable {

    constructor() ERC20("Token", "TKN") Ownable(msg.sender) {}

    function mintTokens(address to, uint256 amount) public onlyOwner {
       _mint(to, amount); 
    }

    function transferTokens(address _receiver, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        transferFrom(msg.sender, _receiver, amount);
    }

    function burnTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender,amount);
    }

}
