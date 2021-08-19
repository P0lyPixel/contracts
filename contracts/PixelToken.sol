// SPDX-License-Identifier: GPL-3.0-only

pragma solidity 0.6.12;

import "./libs/ERC20Capped.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PixelToken is ERC20Capped, Ownable {

	address private constant _BURN_ADDRESS = 0x000000000000000000000000000000000000dEaD;

	constructor(uint256 initialSupply, uint256 cap) public ERC20("Polypixel Token", "PIXEL") ERC20Capped(cap) {
		require(initialSupply <= cap, "Initial supply > cap");
		_mint(msg.sender, initialSupply);
	} 

	function mint(address account, uint256 amount) public onlyOwner {
		ERC20Capped._mint(account, amount);
	}

	function burn(uint256 amount) public {
		transfer(_BURN_ADDRESS, amount);
	}
}