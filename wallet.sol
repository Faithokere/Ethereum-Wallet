// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev{
    
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    }

    receive() external payable {}
    //create getBalance function
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    //create a withdraw function for the contract owner
    function withdraw(uint _amount) public{
        require(msg.sender == owner, "Thief!You're not the owner");
    payable(msg.sender).transfer(_amount);
    }
    //create a withdraw function for anybody to withdraw
    function anybodyCanWithdraw(uint _amount, address payable _to) public {
        _to.transfer(_amount);
    }

}
