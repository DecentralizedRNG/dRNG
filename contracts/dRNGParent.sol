pragma solidity ^0.4.6;

import "Owned.sol"
import "dRNG.sol";
import "dRNGToken.sol";

contract dRNGParent is Owned{

    //dRNG instance
    dRNG private IdRNG;
    //dRNGToken instance
    dRNGToken private IdRNGToken;

    function SetIdRNG (address dRNGAddress) OnlyOwner {
        if(dRNGAddress != address(0)){
            IdRNG = dRNG(dRNGAddress);
        }
    }

    function SetIdRNGToken (address dRNGTokenAddress) OnlyOwner {
        if(dRNGTokenAddress != address(0)){
            IdRNGToken = dRNG(dRNGTokenAddress);
        }
    }

    
}