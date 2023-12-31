pragma solidity ^0.5.0;

contract MyContract {
   uint256 private secretNumber;

   function setSecretNumber(uint256 _secretNumber) private {
       secretNumber = _secretNumber;
   }
}
