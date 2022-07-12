// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./AggregatorV3Interface.sol";

contract FundMe {

    address public immutable owner = msg.sender;
    
    address[] public funders;

    mapping(address => uint256) public fundedAmount;

    function fund() external payable {
        uint256 minimumUsd = 50 * 1e18;
        require(_getConversionRate(msg.value) >= minimumUsd, "Fund at least 50$");
        fundedAmount[msg.sender] = msg.value;
        funders.push(msg.sender);
    }

    function _getAggregatorVersion() private view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e); // rinkeby address from chainlink data feeds
        return priceFeed.version();
    }

    /**
     * @notice Required for _getConversionRate()
     */
    function _getEthPriceInWei() private view returns (uint256) { 
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e); // rinkeby address from chainlink data feeds
        (,int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer) * 1e10;
    }

    /**
     * @notice Required for fund()
     */
    function _getConversionRate(uint256 ethAmount) private view returns (uint256) {
        uint256 ethPriceInWei = _getEthPriceInWei();
        uint256 ethAmountInUsd = (ethPriceInWei * ethAmount) / 1e18;
        return ethAmountInUsd;
    }

    function withdraw() external {
        require(msg.sender == owner, "Not owner");
        payable(msg.sender).transfer(address(this).balance);
        for (uint256 funderIndex = 0; funderIndex < funders.length;) {
            address funder = funders[funderIndex];
            fundedAmount[funder] = 0;
            unchecked {funderIndex++;}
        }
        funders = new address[](0);
    }
}
