pragma solidity ^0.8.17;

contract Bank {
  mapping(address => uint256) public balances;

  function deposit() public payable {
      balances[msg.sender] += msg.value;
  }

  function withdraw(uint256 amount) public {
      require(balances[msg.sender] >= amount, "Not enough balance");
      (bool success, ) = msg.sender.call{value: amount}("");
      require(success, "Transfer failed");
      balances[msg.sender] -= amount;
  }
}

