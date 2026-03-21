// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title PalengkePay
 * @dev Records immutable payment data for local vendors.
 */
contract PalengkePay {

    // State Variables
    string public lastVendorName;
    string public lastPayerName;
    uint256 public totalPayments;

    // Event to log each payment
    event PaymentRecorded(
        string vendorName,
        string payerName,
        uint256 amount
    );

    /**
     * @dev Records a payment and updates totals.
     * @param _vendorName Name of vendor (e.g., "Mang Pedro")
     * @param _amount Payment amount (e.g., 500)
     * @param _payer Name of payer (e.g., "Juan Dela Cruz")
     */
    function recordPayment(
        string memory _vendorName,
        uint256 _amount,
        string memory _payer
    ) public {

        require(_amount > 0, "Amount must be greater than zero");

        lastVendorName = _vendorName;
        lastPayerName = _payer;
        totalPayments += _amount;

        emit PaymentRecorded(_vendorName, _payer, _amount);
    }
}