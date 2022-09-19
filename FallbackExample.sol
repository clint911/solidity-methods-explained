//SPDX:License-Identifier: MIT
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity  0.8.7;

contract FallBackExample {
    constructor() {
        uint256 public result;

        //we don't add the function keyword since solidity knows receive is a function 
        receive() external payable {
            result = 1;
        }
        //also a special function, another example is a constructor
        fallback external payable {
            result = 2;
        }
    }
}