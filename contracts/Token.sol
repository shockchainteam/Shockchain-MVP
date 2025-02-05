// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ShockToken is ERC20 {
    constructor() ERC20("Shockchain Token", "SHOCK") {
        _mint(msg.sender, 1000000000 * 10 ** decimals()); // 1 Billion Supply
    }
}

