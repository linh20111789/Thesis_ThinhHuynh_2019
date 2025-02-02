pragma solidity ^0.5.0;

import "./Authentication.sol";
import "./HouseProperty.sol";
import "./Installable.sol";
import "./Rentable.sol";

contract House is HouseProperty, Rentable, Installable {

    constructor(address payable _owner, string memory _location, uint _price, uint _area) public payable {
        /* Default Part */
        owner = _owner;
        /* House Property Part */
        location = _location;
        area = _area;
        active = true;
        /* Buying Part */
        price = _price;
        buyable = true;
        /* Renting Part */
        rented = false;
        rentable = true;
        rentalDueDate = now;
        rentalPaymentCharge = 1 ether;
        rentalPaymentStep = 30 days;
        rentalDuration = 90 days;
        /* Installment Payment Part */
        inProcess = false;
        installable = true;
        installmentDueDate = now;
        installmentPaymentCharge = 1 ether;
        installmentPaymentStep = 30 days;
        installmentDuration = 90 days;
        interestRate = 10;
        repayRate = 10;
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    /* Fallback methods ! */
    function() external payable {
        /* Fallback function ! */
    }

}
