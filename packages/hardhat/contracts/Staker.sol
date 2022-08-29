// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "hardhat/console.sol";
import "./ExampleExternalContract.sol";

contract Staker {

  ExampleExternalContract public exampleExternalContract;
  address public owner;
  address public contrato;
  uint public constant threshold =1 ether; 

  constructor(address exampleExternalContractAddress) {
      exampleExternalContract = ExampleExternalContract(exampleExternalContractAddress);
      owner = msg.sender;
      // threshold=1.0;
  }
  

  // Collect funds in a payable `stake()` function and track individual `balances` with a mapping:
  // ( Make sure to add a `Stake(address,uint256)` event and emit it for the frontend <List/> display )
  mapping (address => uint256) public balances; //Always add public 
  event Stake (address from, uint ammount); //This will notify when the stake changes 
function stake() public payable  {

  // uint balance = balances[msg.sender] += msg.value; //This is wrong what is coming is a big number and I am asociating it to a uint 
  balances[msg.sender] += msg.value;
  //Emit event, stake 
  emit Stake(msg.sender, msg.value);
  // contrato= 0xB7f8BC63BbcaD18155201308C8f3540b07f84F5e;
  // balances[contrato]+= value.BigNumber; 
  // balance-=value.BigNumber;
   console.log("COMPLETED");
  console.log(balances[msg.sender]);
   console.log("NUMBER");
}
// function stake (address destino, uint value) payable public {
//         payable(destino).transfer(value);
//     }
// function trackBalcances (address user) public returns (uint){
//   uint balance =  balances[user];
//   console.log("BALANCE");
//   console.log(balance);
//   return balance;
// } 

  // After some `deadline` allow anyone to call an `execute()` function
  // If the deadline has passed and the threshold is met, it should call `exampleExternalContract.complete{value: address(this).balance}()`


  // If the `threshold` was not met, allow everyone to call a `withdraw()` function


  // Add a `withdraw()` function to let users withdraw their balance


  // Add a `timeLeft()` view function that returns the time left before the deadline for the frontend


  // Add the `receive()` special function that receives eth and calls stake()
  

}
