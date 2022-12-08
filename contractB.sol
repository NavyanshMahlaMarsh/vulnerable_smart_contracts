// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract B{
    
    uint256 public withdrawLimit = 1 ether;
    mapping(address => uint256) public lastWithdrawLimit;
    mapping(address => uint256) public balances;

    function depositFunds() public payable{
        balances[msg.sender] += msg.value;
    }

    function withdrawFunds (uint256 _weiToWithdraw) public{
        require(balances[msg.sender]>= _weiToWithdraw);
        //limit to withdrawal
        require(_weiToWithdraw<=withdrawLimit);
        //limit the time allowed to withdraw 
        require(now>= lastWithdrawTime[msg.sender] + 1 weeks);
        require(msg.sender.call.value(_weiToWithdraw)());
        lastWithdrawTime[msg.sender]=now;
    }
}