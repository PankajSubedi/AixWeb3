// SPDX-License-Identifier: UNLICENSED



pragma solidity ^0.8.9;

contract CrowdFunding {
   struct Campaign{
      address owner;
      string title;
      string description;
      uint256 target;
      uint256 deadline;
      uint256 amountCollected;
      string image;
      address[] donators;
      uint256[] donations;

   }

   mapping(uint256 => Campaign) public campaigns;

   uint256 public numberOfCampaigns = 0;

// create campaign function logic here
 function createCampaign(address _owner, string memory _title,
 string memory _description, uint256 _target, uint256 _deadline, string memory _image) public returns (uint256)
{
   Campaign storage campaign = campaigns[numberOfCampaigns];

   // check status
   require(campaign.deadline < block.timestamp, "The deadline should be a date in the future");

   campaign.owner = _owner;
   campaign.title = _title;
   campaign.description = _description;
   campaign.target = _target;
   campaign.deadline = _deadline;
   campaign.amountCollected = 0;
   campaign.image = _image;

   // increase number of campaigns
   numberOfCampaigns++;

   // if everything went right then 
   return numberOfCampaigns - 1;
}

//  donate campaign function

function donateToCampaign (uint256 _id) public payable {
   // donation amount from the frontend
   uint256 amount = msg.value;


// to access campaign
   Campaign storage campaign = campaigns[_id];

   // push address of the donators

   campaign.donators.push(msg.sender);
   campaign.donations.push(amount);

   // make trsnsaction
   (bool sent,) = payable(campaign.owner).call{value: amount}("");

   // the conditions for transaction
   if(sent){
      // increase the amount donated 
      campaign.amountCollected = campaign.amountCollected + amount;
   }

}


// get donators details 
function getDonators(uint256 _id) view public returns(address[] memory, uint256[] memory)
{
   return(campaigns[_id].donators, campaigns[_id].donations);
}


// get campaigns details fetch
function getCampaigns() public view returns (Campaign[] memory){

Campaign[] memory allCampaigns = new Campaign[](numberOfCampaigns);

// get all the campaigns 
for(uint i = 0; i< numberOfCampaigns; i++ ){
   Campaign storage item = campaigns[i];
   // fetching from storage and populated to item;
   allCampaigns[i] = item;
}

return allCampaigns;

}



}