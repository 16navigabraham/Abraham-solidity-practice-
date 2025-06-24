// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract Counter {
    uint256 public count;

    function increment() public {
        count += 1;
    }

    function decrement() public {
        require(count > 0,"count is already zero");
        count-= 1;
    }
    function rest() public{
        count = 0;
    }
}
