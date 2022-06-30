# Fund Me

**Fund Me is designed to handle payments (payable) and get real world data from oracles, such as Chainlink.**

```
owner
```
*The owner is the deployer address of Fund Me. Owner needs to be initialized because of the withdraw() function.*

```
funders
```
*Array of addresses who've transacted with the contract via fund() function.*

```
fundedAmount
```
*Retrieves amount funded per address by entering an address.*

```
fund()
```
*Function fund() is payable, which means it can handle transaction with ETH or any other token. Function requires users to fund at least $50. I'm not greedy*

```
getAggregatorVersion()
```
*Get version of the aggregator contract that is used.*

```
getEthPriceInWei()
```
*Function required for the Chainlink oracle path to get real world data conversion rates of ETH => USD. Retrieves current ETH price, in WEI (1e18 WEI = 1 ETH).*

```
getConversionRate()
```
*Function required for the Chainlink oracle path to get real world data conversion rates of ETH => USD.*

```
withdraw()
```
*Function to withdraw fund from contract, only for the owner. Sets funders back to 0.*
