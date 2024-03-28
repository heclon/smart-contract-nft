// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SafeMath{
    function add(uint a, uint b) internal pure returns (uint){
        uint c= a+b;
        require(c>=a, "Addition overflow");
        return c;
    }

    function sub(uint a, uint b) internal pure returns (uint) {
        require(b <= a, "Subtraction underflow");
        uint c = a - b;
        return c;
    }

    function mul(uint a, uint b) internal pure returns (uint) {
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require(c / a == b, "Multiplication overflow");
        return c;
    }

    function div(uint a, uint b) internal pure returns (uint) {
        require(b > 0, "Division by zero");
        uint c = a / b;
        return c;
    }
}

contract MyContract {
    using SafeMath for uint;

    uint public value;

    function setValue(uint _value) public{
        value= _value;
    }

     function increment(uint _amount) public {
        value = value.add(_amount);
    }

    function decrement(uint _amount) public {
        value = value.sub(_amount);
    }

    function multiply(uint _factor) public {
        value = value.mul(_factor);
    }

    function divide(uint _divisor) public {
        value = value.div(_divisor);
    }
}