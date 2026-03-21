// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HackanaDefense {
    uint256 public criticalData;
    address public immutable owner; // 'immutable' saves gas since it's only set once

    constructor() {
        owner = msg.sender;
    }

    // Task 1: Using require() for input validation
    // This is the "gatekeeper" — it checks if the input is valid before running logic.
    function updateCriticalData(uint256 _newData) public {
        require(_newData > 0, "Data must be greater than zero."); 
        
        criticalData = _newData;

        // Task 2: Using assert() for internal invariants
        // We assert that the data was actually updated correctly.
        // If this fails, there is a bug in the EVM or the contract logic itself.
        assert(criticalData == _newData);
    }

    // Task 3: Using revert() for custom logic/Access Control
    function restrictedUpdate(uint256 _newData) public {
        if (msg.sender != owner) {
            // Best for complex "if" logic or when you want to trigger custom errors
            revert("Access denied: You are not the owner.");
        }
        criticalData = _newData;
    }
}
