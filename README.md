## ETH_AVAX_Proof-Intermediate-Project3
This project implement a token according to ERC20 standard. The token can be run on remix or
deployed on a locally functioning ethereum based blockchain.

## Description
In this project I have created a smart contract MyToken. The smart contract implements a 
token called **ButterCoin**. The token is implementd with ERC20 standard in mind. Here's a
short description of each function and state variables in the contract.

**State Variables**
+ `tokenName` - This is a constant that stores the name of the token.
+ `tokenSymbol` - This is a constant that stores the symbol / abbrevation of the token.
+ `contractOwner` - This variable stores the address which deployed the contract.
+ `_balances` - This is a mapping from address to unsigned integer (here used to store tokens).
+ `_allowances` - This a mapping from address to another mapping. The inner mapping is a
mapping from address to unsigned integer. This is used to keep track for allowances given by 
one address to another address to allow spending of some of the tokens.
+ `_totalSupply` - This is a variable to store the total amount of tokens that have been minted.

**Functions**
+ `mint` - This function is used to mint new tokens. It can be only used by the adress that 
deployed the contract;
+ `burn` - This function is used to burn tokens (i.e. permanently destroy them). This function
check if the address has sufficient balances before burning any tokens.
+ `totalSupply` - returns the value of `_totalSupply` variable.
+ `balanceOf` - returns the value from the `_balances` mapping for the give address.
+ `allowance` - returns the value from the `_allowances` mapping for the current tokenOwner and
spender.
+ `transfer` - This function is used to transfer tokens from current address to a given
address. This function check if the current address has sufficient balance before doing any
transfer.
+ `approve` - This function is used to grant allowance for an address.
+ `transferFrom` - This functions is used to transfer tokens from one address to another
address given that the current address has enough allowance to transfer.

## Getting Started
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix 
website at https://remix.ethereum.org/. Once you are on the Remix website, create a new file by 
clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension. Copy and paste
the code is main.sol file into the newly created file. Next from the sidebar go the the compiler tab
and compile the contract. Finally in the deploy tab, deploy the smart contract and interact with it.

## License
This project is unlicensed.