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
    event ErrorOccurred(string message);

    function fund() public payable {
        // Want to be able to set a minimum amount
        // 1. How do we send ETH to this contract
        require (msg.value.getConversionRate() >= minimumUsd, "Didn't send enough");
            funders.push(msg.sender);
            addressToAmountFunded[msg.sender] = msg.value;    
    }

    

     function withdraw() public  {
        /*starting index, ending index, step amount*/
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //reset the array
        funders = new address[](2);

        //actually withdraw the funds
        //transfer

        payable (msg.sender).transfer(address(this).balance);
        //send

        payable (msg.sender)
        //call

        //msg.sender = address
        //payable(msg.sender) = payable address

        
     }
}
