pragma solidity ^0.8.0;

contract InsecureRandomness {
   uint256 private _lastBlockNumber;
   
   function generateRandomNumber() public view returns (uint256) {
       uint256 blockNumber = block.number;
       require(blockNumber > _lastBlockNumber, "Can only generate one random number per block");
       uint256 randomNumber = uint256(blockhash(blockNumber)) % 100 + 1;
       _lastBlockNumber = blockNumber;
       return randomNumber;
   }
}
