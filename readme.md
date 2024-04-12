# Origin

## Created by [SATOSHI NAKAMOTO]() in 2008

# Text Encryption
Plain Text  --> No Encryption
Encoding --> Example: base64
Hashing --> Example: SHA-256
Encryption --> Types: Symmmetric Encryption , Aysmmetric Encryption

# Types of Keys
1. Public Key (Used for encryption)
2. Private Key (Used for Asmmetric Encryption)

## Symmetric Encryption
Uses Public Key for both Encryption and Decryption
Key is shared between the sender and receiver

## Asymmetric Encrytion
Uses Public key for Encryption and Private Key for Decryption
Public Key can be Shared with Anyone, but Private Key should remain secret

# Bitcoin Wallet
Private/Public Key Pair
Private Key - Secret Number
Public Key - Publicly Known Number

# Bitcoin Address
A public key that corresponds to a particular private key. It's like an email address. The bitcoins sent to this address will appear as incoming payments.

# Transactions
Inputs -> Amount of bitcoins being sent from one address to another
Outputs -> Amount of bitcoins being sent from one address to another
Signature -> Proof that you are authorized to spend the funds

# Mining
The process of verifying transactions and adding them to the blockchain
Reward given to miner who found valid block
Difficulty adjusted every 2 weeks

# Blockchain
Blockchain technology is an advanced database mechanism that allows transparent information sharing within a business network. A blockchain database stores data in blocks that are linked together in a chain.

## <a name="contract">Writing Smart Contract and generating Documentation using Solgraph</a>

<details>
  <summary><code>Make new directory "data"</code></summary>
<br />
  
  ```bash
  mkdir data
  cd data
  ```
  
<br />
  
Create smart contract in this directory using IDE, text editor or vim.  
</details>

<details>
  <summary><code>DataContract.sol</code></summary>
<br />
Create Smart Contract like

<br />

```solidity
contract DataContract {
  uint balance;

  function DataContract() {
    Mint(1000000);
  }

  function Mint(uint amount) internal {
    balance = amount;
  }

  function Withdraw() {
    msg.sender.send(balance);
  }

  function GetBalance() constant retruns(uint) {
    return balance;
  }
}
```
</details>

<details>
  <summary><code>Docker pull devopstestlab/solgraph</code></summary>
<br />

Pull solgraph using command

```bash
docker pull devopstestlab/solgraph
```

<div align="center">
  <img src="https://github.com/HarshDubeyDU/Blockchain/blob/main/docker%20pull%20devopstestlab%20solgraph.png" />
</div>
</details>

<details>
<summary><code>Create Documentationn using solgraph</code></summary>

<br />
Enter this command to generate Documentation of your Smart Contract

```bash
docker run -it --rm -v $PWD:/data devopstestlab/solgraph
```

Documentation is created as
<div align="center">
  <img src="https://github.com/HarshDubeyDU/Blockchain/blob/main/DataContract.sol.png">
</div>
</details>


# <a name="auditing">Auditing Smart Contract using different Tools</a>

## <a name="slither">Slither</a>

<details>
  <summary><code>Installing Solidity Compiler</code></summary>
<br />
  
Installation Command

```bash
pip3 install solc-select
```

</details>

<details>
  <summary><code>Installing Slither</code></summary>
<br />
  
Installation Command

```bash
pip3 install slither-analyzer
```

</details>
