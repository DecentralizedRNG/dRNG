pragma solidity ^0.4.6;
import "Owned.sol";
import "dRNG.sol"; 

contract tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData); }

contract dRNGToken is Owned {
    string public standard = 'Token 0.1';
    string public name = 'dRNG Token';
    string public symbol = 'dRT';
    uint8 public decimals = 0;
    uint256 public totalSupply = 1000000;

    address dRNGAddress;

    //Only accept call from dRNG
    modifier OnlydRNG { if (msg.sender != dRNGAddress) return; _; }

    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function dRNGToken() {
        balanceOf[msg.sender] = totalSupply;                 // Give the creator all initial tokens
    }

    /* Set dRNG instance from new address */
    function SetdRNG (address _dRNGAddress) OnlyOwner {
        dRNGAddress = _dRNGAddress;
    }

    /* Reward miner who are mining random numbers */
    function RewardToken(address RewardAddress) OnlydRNG {
        balanceOf[RewardAddress]++;
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
        Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
    }

    /* Allow another contract to spend some tokens in your behalf */
    function approve(address _spender, uint256 _value)
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }

    /* Approve and then comunicate the approved contract in a single tx */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData)
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }        

    /* A contract attempts to get the coins */
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        if (balanceOf[_from] < _value) throw;                 // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw;  // Check for overflows
        if (_value > allowance[_from][msg.sender]) throw;   // Check allowance
        balanceOf[_from] -= _value;                          // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
        allowance[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;
    }

    /* No Etherum will be trapped */
    function () payable {
        throw;
    }
}