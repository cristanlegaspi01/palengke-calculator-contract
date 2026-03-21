// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title PalengkeLedger
 * @dev Helps manage multiple vendors and track total market sales.
 */
contract PalengkeLedger {

    // --- State Variables ---
    string public lastVendorName;       // Stores the most recent vendor name
    uint256 public totalSales;          // Accumulates all sales
    bool public transactionStatus;      // Tracks last transaction status

    // --- Mapping ---
    mapping(address => uint256) public vendorSales; // Vendor address => total sales

    /**
     * @notice Records a sale and updates all records.
     * @param _vendor Address of the vendor
     * @param _vendorName Name of the vendor
     * @param _saleAmount Amount of the sale
     */
    function recordSale(
        address _vendor,
        string memory _vendorName,
        uint256 _saleAmount
    ) public {

        // Reset transaction status before processing
        transactionStatus = false;

        // Update state variables
        lastVendorName = _vendorName;
        totalSales += _saleAmount;
        vendorSales[_vendor] += _saleAmount;

        // Mark transaction as successful
        transactionStatus = true;
    }

    /**
     * @dev Returns the status of the last transaction.
     */
    function isTransactionSuccessful() public view returns (bool) {
        return transactionStatus;
    }
}