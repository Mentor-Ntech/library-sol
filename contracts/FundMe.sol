//Get funds from users
//Withdraw funds
//Set a minimum funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 50 * 1e18;
    
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    event ErrorOccurred(string message);

    function fund() public payable {
        // Want to be able to set a minimum amount
        // 1. How do we send ETH to this contract
        try this.getConversionRate(msg.value) returns (uint256 conversionRate) {
            require(conversionRate >= minimumUsd, "Didn't send enough");
            funders.push(msg.sender);
            addressToAmountFunded[msg.sender] = msg.value;
        } catch Error(string memory errorMessage) {
            emit ErrorOccurred(errorMessage);
            // You can handle the error or take other actions here
        } catch (bytes memory) {
            // Executed for other errors not caught by the specific catch clauses
        }
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int price,, ,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    // function withdraw() {}
}
