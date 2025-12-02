// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

contract SimpleStorage  is Test {
    struct Userdata {
        address walletaddress;
        string socialaccount;
    }

    mapping(string => Userdata) public user;

    function testgetuserdata(string memory _username) public view returns (address, string memory) {
        return (user[_username].walletaddress, user[_username].socialaccount);
    }
     function testadduserdata(string memory _username,  address walletaddress, string memory _socialaccount) public {
        user[_username] = Userdata(walletaddress, _socialaccount);
    }

// function testremoveuserdata(string memory _username) public view {
//         require(user[_username].walletaddress != address(0), "user does not exist");
//     }
}