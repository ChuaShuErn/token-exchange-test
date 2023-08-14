// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract WhatTimeIsIt {


    function timestamp() public view returns (uint256) {
        return block.timestamp;
    }
}