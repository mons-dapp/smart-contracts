## Init Project

```
    npm init -y
```

## Setup Prettier

```
    npm install --save-dev prettier prettier-plugin-solidity
```

- Add format smart contracts to package.json

```
    "format:contracts": "prettier --write --plugin=prettier-plugin-solidity contracts/**/*.sol"
```

## Setup hardhat

```
    npx hardhat init
    npx hardhat compile
    npx hardhat test
    npx hardhat coverage
```

## Setup Smart Contract

- Install `Solidity` from `Nomic Foundation`
- Install OpenZeppelin

```
    npm install @openzeppelin/contracts
```
