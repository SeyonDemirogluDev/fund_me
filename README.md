# Fund Me

**Fund Me is designed to handle payments, such as funding and withdrawals and check for certain conditions, determined from the real world by getting real world data from Chainlink oracles.**

```
owner
```
*The owner is the deployer address of Fund Me. Owner needs to be initialized because of the withdraw() function.*

```
funders
```
*Array of addresses who've funded to the smart contract.*

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
*Get version of the aggregator contract that is used (remote func).*

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
*Function to withdraw fund from contract, only for the owner. Sets funders back to 0, since this is a contract specifically made to be funded.*
