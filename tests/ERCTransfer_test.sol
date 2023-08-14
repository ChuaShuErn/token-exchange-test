// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol";
import "../contracts/RareCoin.sol";
import "../contracts/SkillsCoin.sol";

contract ERCTransferTest {

    RareCoin rcn;
    SkillsCoin skc;
    uint amountMinted = 100;

    constructor() {
        rcn = new RareCoin();
        skc = new SkillsCoin();
    }

    function RareCoinBalance() public view returns (uint256) {
        address me = address(this);
        return rcn.balanceOf(me);
    }

    function SkillsCoinBalance() public view returns (uint256) {
        address me = address(this);
        return skc.balanceOf(me);
    }

    function testMint() public {
        address me = address(this);
        skc.mint(amountMinted);
        Assert.equal(
            skc.balanceOf(me), 
            amountMinted, 
            "Should have the appropriate skills"
        );
    }

    function testApprove() public {
        address me = address(this);
        skc.approve(address(rcn), amountMinted);

        Assert.equal(
            skc.allowance(me, address(rcn)),
            amountMinted,
            "Should be approved to trade"
        );
    } 

    function testTrade() public {
        address me = address(this);
        rcn.trade(skc);
        Assert.equal(
            skc.allowance(me, address(rcn)),
            0,
            "Allowance should be zero"
        );
        Assert.equal(
            skc.balanceOf(me),
            0,
            "Balance should be zero"
        );
        Assert.equal(
            rcn.balanceOf(me),
            amountMinted,
            "Should have traded it all"
        );        

    } 

    function testAsserts() public{
        Assert.equal(true,true,"Should pass");

        Assert.equal(true,false,"Should fail");
    }


    function testWorkflow() public {
        address me = address(this);
        skc.mint(amountMinted);
        Assert.equal(
            skc.balanceOf(me), 
            amountMinted, 
            "Should have the appropriate skills"
        );

        skc.approve(address(rcn), amountMinted);

        Assert.equal(
            skc.allowance(me, address(rcn)),
            amountMinted,
            "Should be approved to trade"
        );

        rcn.trade(skc);
        Assert.equal(
            skc.allowance(me, address(rcn)),
            0,
            "Allowance should be zero"
        );
        Assert.equal(
            skc.balanceOf(me),
            0,
            "Balance should be zero"
        );        
        Assert.equal(
            rcn.balanceOf(me),
            amountMinted,
            "Should have traded it all"
        );        

    }

}