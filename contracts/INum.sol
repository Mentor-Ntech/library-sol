// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface INumber {

     function getVatValue() external  view returns (uint256);

     function addAmount(uint256 _num, address _addr) external  returns (bool);

     function getUserBal(address _addr) external  view returns (uint256);
}


contract Interaction {

    address numberContractAddress;

    constructor(address _contractAddr) {
        numberContractAddress = _contractAddr;
    }

    function getVAT() public  view returns (uint256) {
        return INumber(numberContractAddress).getVatValue();
    }

    function fund(uint amount, address addr) public {
        INumber(numberContractAddress).addAmount(amount, addr);
    }

    function checkBal(address addr) public view returns(uint) {
        return INumber(numberContractAddress).getUserBal(addr);
    }
}