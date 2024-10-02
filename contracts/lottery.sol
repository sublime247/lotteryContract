// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public manager;               // Manager who controls the lottery
    address[] public players;             // List of players in the lottery

    constructor() {
        manager = msg.sender;             // Set the manager as the creator of the contract
    }

    // Function to enter the lottery, requires minimum 0.1 ETH
    function enter() public payable {
        require(msg.value > 0.1 ether, "Minimum amount to enter is 0.1 ETH");  
        players.push(msg.sender);         // Add player to the list
    }

    // Random number generation (simple example, should be improved for real deployment)
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players)));
    }

    // Manager picks a winner from the list of players
    function pickWinner() public restricted {
        uint index = random() % players.length;  // Pick a random winner
        payable(players[index]).transfer(address(this).balance);  // Transfer funds to the winner
        for(uint i = 0; i < players.length; i++) {
            players[i] = address(0);  // Clear the list
        }
        // players.length = 0;
    }

    // Modifier to restrict access to manager
    modifier restricted() {
        require(msg.sender == manager, "Only manager can call this function");
        _;
    }

    // Get list of all players
    function getPlayers() public view returns (address[] memory) {
        return players;
    }
}
