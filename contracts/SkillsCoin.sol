// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract SkillsCoin{

    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    event Logger(uint256);

    constructor(){

    }

    function mint(uint256 amount) public {

        require(totalSupply < 1000000);
        totalSupply += amount;
        balanceOf[msg.sender] += amount;
        
    }

    function approve(address rareCoinAddress, uint256 yourBalanceOfSkillsCoin) public{
        allowance[msg.sender][rareCoinAddress] = 0;
        allowance[msg.sender][rareCoinAddress] = yourBalanceOfSkillsCoin;
    }

    function transferFrom(address you, address RareCoin, uint256 amount) public returns (bool){
            emit Logger(allowance[you][RareCoin]);
         require(amount <= allowance[you][RareCoin],"Not Enough Allowance");
         require(balanceOf[you] >= amount, "Insufficient Balance");
        

        //deduct
        allowance[you][RareCoin] -= amount;
        balanceOf[you] -= amount;
        balanceOf[RareCoin] += amount;

        return true;



    }

    function getBalance() public view returns (uint256){
        return balanceOf[msg.sender];
    }

}