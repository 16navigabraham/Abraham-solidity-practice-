// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;
//add user , get userdata,delete userdata for survey
contract SimpleStorage {
    struct Userdata {
    address walletaddress;
    string username;
    bytes32 password;
    string socialaccount;
       }

       mapping (string => Userdata) user;

    function getuserdata(string memory _username, string memory _password) public view returns (address, string memory) {
        require(user[_username].password == keccak256(abi.encodePacked(_password)), "Incorrect password");
        return (user[_username].walletaddress, user[_username].socialaccount);
    }
    function adduserdata(string memory _username, bytes32 _password, address walletaddress, string memory _socialaccount) public {
        user[_username] = Userdata(walletaddress, _username, _password, _socialaccount);
    }
    function removeuserdata(string memory _username) public {
        require(user[_username].walletaddress != address(0), "user does not exist");
        delete user[_username];
    }}