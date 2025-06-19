// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/token.sol";


contract NAVIGTest is Test {
    NAVIG public navigToken;



    // Define the NAVIG token contract
    function setUp() public {
        navigToken = new NAVIG(1_000_000 * 10 ** 18); // Initial supply of 1 million tokens
    }

    function testInitialSupply() public view {
        assertEq(navigToken.totalSupply(), 1_000_000 * 10 ** 18);
        assertEq(navigToken.balanceOf(address(this)), 1_000_000 * 10 ** 18);
    }

    function testMint() public {
        address to = address(0x123);
        navigToken.mint(to, 100 * 10 ** 18);
        assertEq(navigToken.balanceOf(to), 100 * 10 ** 18);
    }
}