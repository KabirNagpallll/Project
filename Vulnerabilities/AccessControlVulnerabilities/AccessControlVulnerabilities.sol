// Example of an unrestricted initialization function
function initContract() public {
   owner = msg.sender;
}
//In this example, anyone can initialize the contract and become the owner.


// Example of inappropriate access control in token burning
function burn(address account, uint256 amount) public {
   _burn(account, amount);
}
//In this example, any user can burn tokens


// Example of an access control bypass
contract UpgradeableContract {
   // ...
   function updateLogicAddress(address _newAddress) public {
       // Should be restricted to owner only
       logicAddress = _newAddress;
   }
}
//In this example, anyone can update the logic address, potentially upgrading a smart contract's new implementation logic to contain malicious code.

