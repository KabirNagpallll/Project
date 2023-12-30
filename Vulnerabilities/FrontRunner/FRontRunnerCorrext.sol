pragma solidity ^0.8.17;

contract GuessTheNumberChallenge {
   bytes32 challenge;
   mapping(address => bytes32) public commits;

   constructor(bytes32 _challenge) payable {
       require(msg.value == 1 ether);
       challenge = _challenge;
   }

   function isComplete() public view returns (bool) {
       return address(this).balance == 0;
   }

   function commit(bytes32 commitment) public payable {
       require(msg.value == 1 ether, "Submission fee required");
       commits[msg.sender] = commitment;
   }

   function guess(uint256 number) public {
       require(commits[msg.sender] != bytes32(0), "Commit first");
       uint256 balance = address(this).balance;
       require(balance != 0, "Game has ended");
       bytes32 userChallenge = keccak256(abi.encode(number));

       if (userChallenge == challenge && keccak256(abi.encode(number)) == commits[msg.sender]) {
           (bool success, ) = msg.sender.call{value: balance}("");
           require(success, "Transfer failed");
       }
   }
}

