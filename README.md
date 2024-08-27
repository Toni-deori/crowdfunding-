# StudentCrowdfunding Smart Contract

## Vision
The `StudentCrowdfunding` smart contract is designed to empower students by providing them with a platform to raise funds for their educational needs. Through decentralized crowdfunding, students can create campaigns to reach their financial goals, and donors from around the world can contribute to these causes, ensuring transparency and security through blockchain technology.

## Features
- **Create Campaign**: Students can create a crowdfunding campaign by specifying their name, description, and the goal amount they wish to raise.
- **Donate to Campaign**: Supporters can donate to active campaigns, contributing to the student's goal.
- **Campaign Completion**: Campaigns automatically mark as completed once the goal amount is reached.
- **Withdraw Funds**: Upon successful completion of a campaign, students can withdraw the funds.
- **View Campaign Details**: Anyone can view the details of a specific campaign, including its status, goal amount, and funds raised.

## Smart Contract Diagram

```plaintext
+---------------------+
| StudentCrowdfunding |
+---------------------+
         |
         | createCampaign()
         |
+-------------------+
|   Campaign 1      |<---+
|-------------------|    | donate()
| student           |    |
| name              |    |
| description       |    |
| goalAmount        |    |   
| currentAmount     |    |  
| isCompleted       |    |
| isWithdrawn       |    |
+-------------------+    |
         |               |
         +----------------> getCampaign()
         |
         +--> withdrawFunds()
```

## Deployment

To deploy the `StudentCrowdfunding` smart contract, follow these steps:

1. **Install Dependencies**: Make sure you have [Remix IDE](https://remix.ethereum.org/) or a local Ethereum development environment set up (e.g., Truffle, Hardhat).

2. **Copy the Smart Contract**: Copy the `StudentCrowdfunding` smart contract code into a new file named `StudentCrowdfunding.sol`.

3. **Compile the Contract**: In Remix, select the appropriate Solidity compiler version (`0.8.0` or above) and compile the contract.

4. **Deploy the Contract**: 
   - Deploy the contract to the desired Ethereum network (e.g., Ropsten, Rinkeby, or the Ethereum mainnet) by selecting the appropriate environment in Remix or using deployment scripts in your local environment.
   - Confirm the transaction and wait for it to be mined.

5. **Interact with the Contract**: 
   - Use Remix's interface or your own front-end to interact with the deployed contract.
   - Create campaigns, make donations, and withdraw funds as needed.

## Functions Overview

### Public Functions
- `createCampaign(string memory _name, string memory _description, uint256 _goalAmount)`: Allows a student to create a new crowdfunding campaign.
- `donate(uint256 _campaignId)`: Enables a donor to contribute to an active campaign.
- `withdrawFunds(uint256 _campaignId)`: Allows the student to withdraw funds after the campaign goal is reached.
- `getCampaign(uint256 _campaignId)`: Retrieves details about a specific campaign.

## Contact
For any inquiries or support, please reach out via tonideori249@gmail.com

This README provides a comprehensive guide for understanding, deploying, and interacting with the `StudentCrowdfunding` smart contract.

## Deployment:

Contract Address: 0x07da5e043a52af9db8b645f9625160bd1544b496
![image](https://github.com/user-attachments/assets/bdc733cf-e63f-4184-ac7d-a4eed92d81ab)



 

