pragma solidity ^0.5.0;

contract MyContract {
   uint256 public secretNumber;

   function setSecretNumber(uint256 _secretNumber) public {
       secretNumber = _secretNumber;
   }
}
