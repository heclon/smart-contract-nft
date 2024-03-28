// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingDemo{
    uint public totalSupply;
    mapping (address => uint) public balances;

    constructor(uint _intialSupply){
        require(_intialSupply > 0, "Initial supply must be non-zero");
        totalSupply = _intialSupply;
        balances[msg.sender] = _intialSupply;
    }


    function transfer(address _to, uint _value) public returns (bool Success){
        require(_to != address(0), "Receiver address cannot be 0x0");
        require(balances[msg.sender] >= _value, "Insufficient balance");

        balances[msg.sender] -= _value;
        balances[_to] += _value;

        assert(balances[msg.sender]+ balances[_to]==totalSupply);
        return true;
    }
    
    function forceError() public pure {
        revert("Forced Error");
    }
}