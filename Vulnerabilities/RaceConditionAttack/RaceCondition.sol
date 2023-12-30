pragma solidity ^0.8.17;

contract TokenSwap {
   mapping(address => uint256) public balances;

   function deposit(uint256 amount) public {
       require(amount > 0, "Amount must be greater than 0");
       balances[msg.sender] += amount;
   }

   function swapTokens(address recipient, uint256 amount) public {
       require(balances[msg.sender] >= amount, "Not enough tokens");
       require(recipient != address(0), "Invalid recipient");
       balances[msg.sender] -= amount;
       balances[recipient] += amount;
   }
}

