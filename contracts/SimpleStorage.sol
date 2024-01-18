// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {

    uint256 public  favoriteNumber;
    People public person = People({favoriteNumber: 2, name: "Dan", color:"red", fav_friend: "Umar", age: 30});

    struct People {
        uint256 favoriteNumber;
        string name;
        string color;
        string fav_friend;
        uint256 age;
    }

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        //favoriteNumber = favoriteNumber +10;
        uint256 testVar = 5;
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    
}