pragma solidity ^0.8.17;

contract GuessTheNumberChallenge {
   bytes32 challenge;

   constructor(bytes32 _challenge) payable {
       require(msg.value == 1 ether);
       challenge = _challenge;
   }

   function isComplete() public view returns (bool) {
       return address(this).balance == 0;
   }

   function guess(uint256 number) public payable {
       require(msg.value == 1 ether, "Submission fee required");
       uint256 balance = address(this).balance;
       require(balance != 0, "Game has ended");
       bytes32 userChallenge = keccak256(abi.encode(number));

       if (userChallenge == challenge) {
           (bool success, ) = msg.sender.call{value: balance}("");
           require(success, "Transfer failed");
       }
   }
}

