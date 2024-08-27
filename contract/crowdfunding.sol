// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentCrowdfunding {
    
    // Struct to represent a crowdfunding campaign
    struct Campaign {
        address payable student;
        string name;
        string description;
        uint256 goalAmount;
        uint256 currentAmount;
        bool isCompleted;
        bool isWithdrawn;
    }

    // Mapping from campaign ID to Campaign details
    mapping(uint256 => Campaign) public campaigns;

    // Counter to keep track of campaign IDs
    uint256 public campaignCount;

    // Event to be emitted when a new campaign is created
    event CampaignCreated(
        uint256 indexed campaignId,
        address indexed student,
        string name,
        uint256 goalAmount
    );

    // Event to be emitted when a donation is made
    event DonationReceived(
        uint256 indexed campaignId,
        address indexed donor,
        uint256 amount
    );

    // Event to be emitted when funds are withdrawn
    event FundsWithdrawn(
        uint256 indexed campaignId,
        address indexed student,
        uint256 amount
    );

    // Function to create a new crowdfunding campaign
    function createCampaign(
        string memory _name,
        string memory _description,
        uint256 _goalAmount
    ) public {
        require(_goalAmount > 0, "Goal amount should be greater than zero");

        campaignCount++;
        campaigns[campaignCount] = Campaign({
            student: payable(msg.sender),
            name: _name,
            description: _description,
            goalAmount: _goalAmount,
            currentAmount: 0,
            isCompleted: false,
            isWithdrawn: false
        });

        emit CampaignCreated(campaignCount, msg.sender, _name, _goalAmount);
    }

    // Function to donate to a campaign
    function donate(uint256 _campaignId) public payable {
        require(_campaignId > 0 && _campaignId <= campaignCount, "Campaign does not exist");
        Campaign storage campaign = campaigns[_campaignId];
        require(!campaign.isCompleted, "Campaign is already completed");
        require(msg.value > 0, "Donation amount should be greater than zero");

        campaign.currentAmount += msg.value;

        // Check if the goal amount has been reached
        if (campaign.currentAmount >= campaign.goalAmount) {
            campaign.isCompleted = true;
        }

        emit DonationReceived(_campaignId, msg.sender, msg.value);
    }

    // Function for the student to withdraw funds
    function withdrawFunds(uint256 _campaignId) public {
        require(_campaignId > 0 && _campaignId <= campaignCount, "Campaign does not exist");
        Campaign storage campaign = campaigns[_campaignId];
        require(msg.sender == campaign.student, "Only the student can withdraw funds");
        require(campaign.isCompleted, "Campaign is not yet completed");
        require(!campaign.isWithdrawn, "Funds have already been withdrawn");

        uint256 amountToWithdraw = campaign.currentAmount;
        campaign.isWithdrawn = true;
        campaign.student.transfer(amountToWithdraw);

        emit FundsWithdrawn(_campaignId, msg.sender, amountToWithdraw);
    }

    // Function to get campaign details
    function getCampaign(uint256 _campaignId)
        public
        view
        returns (
            string memory,
            string memory,
            uint256,
            uint256,
            bool,
            bool
        )
    {
        require(_campaignId > 0 && _campaignId <= campaignCount, "Campaign does not exist");
        Campaign memory campaign = campaigns[_campaignId];
        return (
            campaign.name,
            campaign.description,
            campaign.goalAmount,
            campaign.currentAmount,
            campaign.isCompleted,
            campaign.isWithdrawn
        );
    }
}
