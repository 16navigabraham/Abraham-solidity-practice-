// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract crowdfunds{

    address public owner;
    mapping(address => uint256) public contributors;
    uint256 public totalFundsRaised;
    uint256 public deadline;
    uint256 public fundingGoal;

    event ContributionReceived(address indexed contributor, uint256 amount);

    constructor(uint256 _fundingGoal, uint256 _duration) {
        owner = msg.sender;
        fundingGoal = _fundingGoal;
        deadline = block.timestamp + _duration;
    }

    function contribute() public payable {
        // Function to allow users to contribute to the crowdfunding campaign
        // Checks if the funding goal has not been met and the deadline has not passed
        require(block.timestamp < deadline, "Funding deadline has passed");
        require(totalFundsRaised < fundingGoal, "Funding goal has been met");
        require(msg.value > 0, "Contribution must be greater than 0");
        contributors[msg.sender] += msg.value;
        totalFundsRaised += msg.value;
        emit ContributionReceived(msg.sender, msg.value);   
    }

    function withdrawFunds() public {
        // Function to allow the owner to withdraw funds raised
        require(msg.sender == owner, "Only the owner can withdraw funds");
        require(totalFundsRaised > 0, "No funds to withdraw");
        
        uint256 amount = totalFundsRaised;
        totalFundsRaised = 0; // Reset total funds raised
        payable(owner).transfer(amount);
        }

        function refund() public {
            // Allows contributors to reclaim their funds if the goal is not met by the deadline.
            require(block.timestamp > deadline, "Cannot refund before deadline");
            require(totalFundsRaised < fundingGoal, "Funding goal was met");
            uint256 amount = contributors[msg.sender];
            require(amount > 0, "No funds to refund");
            contributors[msg.sender] = 0;
            payable(msg.sender).transfer(amount);
        }

        function getContribution(address contributor) public view returns (uint256) {
            // Returns how much a specific address has contributed.
            return contributors[contributor];
        }

        function getTotalFundsRaised() public view returns (uint256) {
            // Returns the total funds raised so far.
            return totalFundsRaised;
        }
        // The funding goal and deadline are set during contract deployment via the constructor.
        // The frontend should collect these values from the user and pass them to the constructor when deploying the contract.
}