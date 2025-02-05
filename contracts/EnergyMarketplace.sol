// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnergyMarketplace {
    struct Listing {
        address seller;
        uint256 energyAmount;
        uint256 price;
        bool active;
    }

    mapping(uint256 => Listing) public listings;
    uint256 public listingCount;

    function createListing(uint256 energyAmount, uint256 price) public {
        listings[listingCount] = Listing(msg.sender, energyAmount, price, true);
        listingCount++;
    }

    function buyEnergy(uint256 listingId) public payable {
        require(listings[listingId].active, "Listing not available");
        require(msg.value == listings[listingId].price, "Incorrect payment");

        listings[listingId].active = false;
        payable(listings[listingId].seller).transfer(msg.value);
    }
}

