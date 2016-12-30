pragma solidity ^0.4.6;

import "dRNG.sol";
import "dRNGToken.sol";

contract dRNGParent{
    //dRNG instance
    dRNG IdRNG;
    //dRNGToken instance
    dRNGToken  IdRNGToken;
    modifier onlyOwner(){

    }
}