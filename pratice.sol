// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.9.0;
//add user , get userdata,delete userdata for survey
contract SimpleStorage {
    struct Userdata {
    address walletaddress;
    string username;
    bytes32 password;
    string socialaccount
       }
       mapping (string => Userdata) user;

    function getuserdata( string memeory _username, string memeory_password) public view returns  
        (address, string memeory){
         require(user[_username].passwordHash == keccak256(abi.encodedPacked(_pasword)), "Incorrect password");
        return (user[_username].walletaddress,user[_username].socialaccount);
    }
    function adduserdata(string memeory _username, string memory _pasword, address walletaddress) public {
        user[_username] = Userdata(walletaddress,_username,_pasword, _socialaccount);
    }
    function removeuserdata(string _username) public{
        require(user[_username].walletaddress != address(0),"user does not exist"):
        delete user[_username]
    }
}