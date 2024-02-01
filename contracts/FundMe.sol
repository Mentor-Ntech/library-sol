//Get funds from users
//Withdraw funds
//Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe {

    using  PriceConverter for uint256;
    uint256 public minimumUsd = 50 * 1e18;
    
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    // event ErrorOccurred(string message);

    address public  owner;
    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        // Want to be able to set a minimum amount
        // 1. How do we send ETH to this contract
        require (msg.value.getConversionRate() >= minimumUsd, "Didn't send enough");
            funders.push(msg.sender);
            addressToAmountFunded[msg.sender] = msg.value;    
    }

    

     function withdraw() public  onlyOwner{

       
        /*starting index, ending index, step amount*/
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //reset the array
        
        (bool callSuccess, )= payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");

        //msg.sender = address
        //payable(msg.sender) = payable address

        
    }

    modifier  onlyOwner{
        require(msg.sender == owner, "Sender is not owner!");
        _;
    }
}



// funders = new address[](2);

//         //actually withdraw the funds
//         //transfer

//         payable (msg.sender).transfer(address(this).balance);
//         //send

//         bool sendSuccess = payable(msg.sender).send(address(this).balance);
//         require(sendSuccess, "Send failed");

//         //call