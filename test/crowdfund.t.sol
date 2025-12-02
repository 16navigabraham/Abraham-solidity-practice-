// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/crowdfundme.sol"; // Adjust path to your contract

contract CrowdfundTest is Test {
    crowdfunds public crowdfunding;

    function setUp() public {
        crowdfunding = new crowdfunds(100 ether, 1 weeks);
    }

    function testContribute() public payable {
        crowdfunding.contribute{value: 1 ether}();
        assertEq(crowdfunding.getTotalFundsRaised(), 1 ether);
    }

 function testRefund() public {
    address payable user = payable(address(1));
    vm.deal(user, 1 ether); // give user ETH

    vm.prank(user);
    crowdfunding.contribute{value: 1 ether}();

    vm.warp(block.timestamp + 1 weeks + 1);

    vm.prank(user);
    crowdfunding.refund();

    assertEq(crowdfunding.getContribution(user), 0);
}


  function testWithdrawFunds() public {
    vm.prank(address(this)); // this = owner
    crowdfunding.contribute{value: 1 ether}();
    
    vm.prank(address(this));
    crowdfunding.withdrawFunds();

    assertEq(address(crowdfunding).balance, 0);
}


}
// This test contract sets up a crowdfunding campaign and tests the contribute, withdraw, and refund functionalities.
// It uses the Forge testing framework to simulate transactions and check the state of the contract after each operation.
// The `setUp` function initializes the crowdfunding contract with a funding goal of 100 ether