pragma solidity ^0.8.17;

contract RewardVault {
  uint256 public totalDeposited = 0;
  uint256 public constant LIMIT = 1 ether;
  address public lastDepositor;

  function deposit() public payable {
      require(totalDeposited + msg.value <= LIMIT, "Limit reached");
      totalDeposited += msg.value;
      lastDepositor = msg.sender;
  }

  function withdrawReward() public {
      require(lastDepositor == msg.sender, "Only the last depositor can withdraw");
      require(totalDeposited > LIMIT, "Limit not reached yet");
      uint256 reward = totalDeposited - LIMIT;
      totalDeposited -= reward;
      (bool success, ) = msg.sender.call{value: reward}("");
      require(success, "Transfer failed");
  }
}
