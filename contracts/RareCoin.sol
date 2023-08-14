// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./SkillsCoin.sol";
contract RareCoin {

    
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    
    event Logger (uint256);

    constructor(){

    }

    function trade(SkillsCoin skillsCoin) public{
        
       
        uint256 amount = skillsCoin.balanceOf(msg.sender);
        emit Logger(amount);
        skillsCoin.transferFrom(msg.sender, address(this), amount);
        balanceOf[msg.sender] += amount;

    }
}