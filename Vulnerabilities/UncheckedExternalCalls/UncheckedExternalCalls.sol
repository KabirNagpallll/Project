contract VulnerableContract {
   address payable public owner;

   constructor() {
       owner = msg.sender;
   }

   function withdrawAll() public {
       require(msg.sender == owner);
       owner.transfer(address(this).balance);
      //Edit balance baadmein;
   }
}

