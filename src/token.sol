// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

 contract NAVIG is ERC20 {
    constructor(uint256 initialSupply) ERC20 ("NAVIG","NAVIG"){
        _mint(msg.sender,initialSupply);
    }
        function mint(address to,uint256 amount)external {
            _mint(to, amount);
            }

            function burn(uint256 amount) external{
                 _burn(msg.sender,amount);
            }

            function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
        }
 }
