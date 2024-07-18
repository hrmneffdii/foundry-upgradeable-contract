
# Upgradeable Smart Contract

A smart contract application for implementing upgradeable smart contract via UUPS. Users should be able to use implementation of BoxV1. When Users want to upgrade the implementation contract (that is BoxV2), it will be running clearly. 

- [Upgradeable Smart Contract](#upgradeable-smart-contract)
- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
- [Usage](#usage)
  - [Deploy (local)](#deploy-local)
  - [Testing](#testing)
    - [Test Coverage](#test-coverage)
- [Audit Scope Details](#audit-scope-details)
  - [Roles](#roles)

# Getting Started

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

## Quickstart

```
git clone https://github.com/hrmneffdii/foundry-upgradeable-contract
cd foundry-upgradeable-contract
forge build
```

# Usage

## Deploy (local)

1. Start a local node

```
make anvil
```

2. Deploy

This will default to your local node. You need to have it running in another terminal in order for it to deploy.

```
make deploy
```

## Testing

```
make test
```

### Test Coverage

```
make coverage
```

and for coverage based testing: 

### Test Coverage-debug
```
make coverage-debug
```

# Audit Scope Details


- In Scope:
```
./src/
|── BoxV1.sol
└── BoxV2.sol
```
- Solc Version: 0.8.19
- Chain(s) to deploy contract to: Ethereum

## Roles

- Owner: The user who can use and set the logic of implementation contract 
- Outsides: No one else should be able to use or set the implementation of contract

