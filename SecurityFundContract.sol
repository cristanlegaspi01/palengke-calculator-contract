// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecurityFund {
    address public owner;
    uint256 public totalDonations;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function donate() public payable {
        require(msg.value > 0, "Donation must be greater than zero");
        totalDonations += msg.value;
    }

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        totalDonations = 0;
        payable(owner).transfer(balance);
    }
}