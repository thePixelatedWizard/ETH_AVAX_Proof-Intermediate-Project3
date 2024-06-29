// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.20;

contract MyToken {
	string public constant tokenName = "ButterCoin";
	string public constant tokenSymbol = "BTC";
	
	address public contractOwner;
	
 	mapping(address account => uint256) private _balances;

    mapping(address account => mapping(address spender => uint256)) private _allowances;

    uint256 private _totalSupply;

    constructor() {
		contractOwner = msg.sender;
	}

	function mint(uint amount) public {
		if (msg.sender != contractOwner) {
			revert("Only the owner can mint tokens");
		}
		_balances[contractOwner] += amount;
		_totalSupply += amount;
	}

	function burn(uint amount) public {
		uint currentTokens = balanceOf(msg.sender);
		if (currentTokens < amount) {
			revert("Insufficient tokens to burn");
		}
		_balances[msg.sender] -= amount;
		_totalSupply -= amount;

	}

	function totalSupply() public view returns (uint256) {
		return _totalSupply;
	}

	function balanceOf(address tokenOwner) public view returns (uint) {
		return _balances[tokenOwner];
	}

	function allowance(address tokenOwner, address spender) public view returns (uint) {
		return _allowances[tokenOwner][spender];
	}

	function transfer(address to, uint tokens) public returns (bool) {
		address owner = msg.sender;
		uint currentTokens = balanceOf(owner);
		if (currentTokens < tokens) {
			revert("Insufficient tokens to transfer");
		}
		_balances[owner] -= tokens;
		_balances[to] += tokens;
		return true;
	}

	function approve(address spender, uint tokens)  public returns (bool) {
		address owner = msg.sender;
		_allowances[owner][spender] = tokens;
		return true;
	}

	function transferFrom(address from, address to, uint tokens) public returns (bool) {
		uint currentTokens = balanceOf(from);
		if (currentTokens < tokens) {
			revert("Insufficient tokens to transfer");
		}

		uint currentAllowance = allowance(from, msg.sender);
		if (currentAllowance < tokens) {
			revert("You don't have enough allowance to transfer");
		}

		_balances[from] -= tokens;
		_allowances[from][msg.sender] -= tokens;
		_balances[to] += tokens;
		return true;
	}

}