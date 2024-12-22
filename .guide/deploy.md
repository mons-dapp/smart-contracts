## Setup Alchemy

- Sign up for Alchemy account

## Deploy to Sepolia

- Need amount of SepoliaETH for gas fee
- Can mining at `https://sepolia-faucet.pk910.de` which requires `passport score of at least 2`
- Gain passport score at `https://app.passport.xyz` (Github, Google...)
- Download Passport JSON to verify manually at `https://sepolia-faucet.pk910.de`
- Run deploy script

```
    npx hardhat run scripts/deploy.js
```

- Check deployment on `https://sepolia.etherscan.io/address/<contract_address>`

## Verify and Publish

- Sign up a new account `https://etherscan.io/register` to get API Key
- Add etherscan prop to hardhat config

```
    etherscan: {
        apiKey: {
        sepolia: 'your API key',
        },
    },
```

- Verify contract

```
    npx hardhat verify --network sepolia <contract-address>
    npx hardhat verify --network sepolia <contract-address> "'Constructor Param 1', 'Constructor Param 2'"
```
