// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {

    uint256  favoriteNumber;
    //People public person = People({favoriteNumber: 2, name: "Dan", color:"red", fav_friend: "Umar", age: 30});

    //MAPPING
    mapping(string => uint256) public  nameToFavoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
        string color;
        string fav_friend;
        uint256 age;
    }

    //ARRAY
   // uint256[] public favoriteNumbersList;
    People[] public people;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        //favoriteNumber = favoriteNumber +10;
        // uint256 testVar = 5;
    }

    //View, pure
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    //Array
    //calldata, memory, storage
    // function addPerson(string memory _name, uint256 _favoriteNumber, string memory _color, string memory _fav_friend, uint256 _age) public {
    //     People memory newPerson = People({favoriteNumber:_favoriteNumber, name:_name, color: _color, fav_friend: _fav_friend, age: _age});
    //     people.push(newPerson);
    // }

    //Mapping

    function addPerson(string memory _name, uint256 _favoriteNumber, string memory _color, string memory _fav_friend, uint256 _age) public {
        people.push(People(_favoriteNumber, _name, _color, _fav_friend, _age));
        nameToFavoriteNumber[_name]= _favoriteNumber;
    }
} 

contract StorageFactory {
    SimpleStorage public simpleStorage;

    function createSimpleStorageContract() public  {
        //How does storage factory know what simple looks like like?

        simpleStorage = new SimpleStorage();
    }
}