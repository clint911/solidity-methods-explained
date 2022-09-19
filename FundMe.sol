// SPDX-License-Identifier:MIT;
// SPDX-License-Identifier: SEE LICENSE IN LICENSE;
pragma solidity  0.8.0;

import "./PriceConverter.sol";
contract FundMe {

    using PriceConverter for uint256;

    uint256 public MINIMU_USD = 50 * 1e18;

        //immutable address 
        address public immutable  i_owner;
        
            constructor() {
        owner = msg.sender;

    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender]
    }
    function Withdraw() public  onlyOwner {
        //making only owner to be able to call these methods 
        //require(msg.sender == owner, "sender has to be the owner");
        //starting index, ending index, step amount
        for(uint256, funderIndex = 0; funderIndex < funders.length; funderIndex = funderIndex++) {
            //code 
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0; 
        }
        
    }
    //next thing is to reset the array 
    
    funders = new address[](0); 
    //actually make the withdrawal


    //transfer
    //send
    //call
    payable(msg.sender).transfer(address(this).balance);
    //send
    payable(msg.sender).send(address(this).balance);
    require(sendSuccess, "send failed");
    //call command, its a low level command
    (bool callSuccess, bytes dataReturned) = payable(msg.sender).call{value: address(this).balance}("");

    modifier  onlyOwner {
        require(msg.sender == i_owner, "Only the owner is allowed to call this function");
        _;
        
        if(msg.sender != i_owner) { revert NotOwner(); }
    }

    //what happens when one sends this contract eth without calling the fund function

    
    
}
