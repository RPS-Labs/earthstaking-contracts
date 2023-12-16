// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EarthstakingRewardPoints {
  address public operator;

  constructor() {
    operator = msg.sender;
  }

  mapping(address => uint256) public userToTiers;

  function transferOperator(address newOperator) external returns (bool) {
    require(msg.sender == operator, "Earthstaking: not operator");
    require(newOperator != address(0), "Earthstaking: zero address");
    operator = newOperator;
    return true;
  }

  function addReferral() public pure returns (bool) {
    return true;
  }

  function getStakingRewards(address staker) public view returns (uint256) {
    uint256 totalETHStaked = _getTotalETHStaked(staker);
    uint256 totalBTCStaked = _getTotalBTCStaked(staker);
    uint256 tier = userToTiers[staker];
    uint256 totalStaked = totalETHStaked + totalBTCStaked;
    uint256 rewardPoints = totalStaked / 1000000000000000000;
    return rewardPoints;
  }

  // Replace with Earthstaking contracts
  function _getTotalETHStaked(address staker) internal pure returns (uint256) {
    return 123456789;
  }

  // Replace with Earthstaking contracts
  function _getTotalBTCStaked(address staker) internal pure returns (uint256) {
    return 987654321;
  }

  // Tier A referral codes need to be set
  // Add referral is a signature validation process.
}
