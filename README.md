# Lottery Smart Contract

## Overview
The `Lottery` contract is a simple decentralized application (dApp) that allows users to enter a lottery by sending a minimum amount of Ether. The contract owner (manager) can pick a random winner from the pool of participants, and the entire balance of the contract is transferred to the selected winner. This contract demonstrates the basic mechanics of a lottery system on the Ethereum blockchain.

## Features
- **Enter Lottery**: Users can enter the lottery by sending at least 0.1 ETH to the contract.
- **Pick Winner**: The manager can randomly select a winner and transfer the entire balance to them.
- **View Participants**: Anyone can view the list of current participants.
- **Manager Restricted Actions**: Only the manager can perform certain actions like picking a winner.

---

## Contract Functions

### `enter`
- **Description**: Allows a user to participate in the lottery.
- **Requirements**:
  - The user must send at least `0.1` ETH.
- **Effects**:
  - Adds the user’s address to the `players` list.
- **Returns**: None.
- **Usage**:
  ```solidity
  enter() payable
