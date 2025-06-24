// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/counter.sol";

contract CounterTest is Test{
    Counter counter;

   function setUp() public {
       counter = new Counter();
   }


    function testIncrement() public {
        counter.increment();
        assertEq(counter.count(), 1);
    }

    function testDecrement() public {
        counter.increment();//make sure count >0
        counter.decrement();
        assertEq(counter.count(), 0);
    }

    function testDecrementZeroReverts() public {
        vm.expectRevert("cunt is already zero");
        counter.decrement();
    }
}