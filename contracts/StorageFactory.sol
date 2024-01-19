// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public  {
        //How does storage factory know what simple looks like like?
       SimpleStorage simpleStorage = new SimpleStorage();
       simpleStorageArray.push(simpleStorage);

    }
    
    function stfStore(uint256 _simpleStorageIndex, uint _simpleStorageNumber) public {
        //Address
        //ABI -Application Binary In
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
         simpleStorage.store(_simpleStorageNumber);
    }
     
     function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return  simpleStorageArray[_simpleStorageIndex].retrieve();
        
    }

}