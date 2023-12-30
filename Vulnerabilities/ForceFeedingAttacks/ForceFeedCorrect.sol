pragma solidity ^0.8.17;

import "./RewardVault.sol";

contract Attacker {
  RewardVault public vault;

  constructor(RewardVault _vault) {
      vault = _vault;
  }

  receive() external payable {
      vault.deposit{value: msg.value}();
  }
}

