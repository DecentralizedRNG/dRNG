pragma solidity ^0.4.6;

contract Owned {
    //Owner address
    address public Owner = msg.sender;

    //Only accept owner
    modifier OnlyOwner { if (msg.sender != Owner) return; _; }

    //Owner was changed
    event NewOwner(address indexed old, address indexed current);

    function SetOwner(address NewOwnerAddress) OnlyOwner { NewOwner(Owner, NewOwnerAddress); Owner = NewOwnerAddress; }
}