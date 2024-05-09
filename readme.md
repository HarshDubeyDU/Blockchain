# Origin

## Created by [SATOSHI NAKAMOTO]() in 2008

# Text Encryption
Plain Text  --> No Encryption
<br />
Encoding --> Example: base64
<br />
Hashing --> Example: SHA-256
<br />
Encryption --> Types: Symmmetric Encryption , Aysmmetric Encryption
<br />

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
<br />
Check Slither version

```bash
slither --version
```

</details>

<details>
  <summary><code>Writing Smart Contract with possible attacks</code></summary>

  ```solidity
pragma solidity ^0.4.15;

contract Reentrance {
    mapping (address => uint) userBalance;
   
    function getBalance(address u) constant returns(uint){
        return userBalance[u];
    }

    function addToBalance() payable{
        userBalance[msg.sender] += msg.value;
    }   

    function withdrawBalance(){
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.call.value(userBalance[msg.sender])() ) ){
            throw;
        }
        userBalance[msg.sender] = 0;
    }   

    function withdrawBalance_fixed(){
        // to protect against re-entrancy, the state variable
        // has to be change before the call
        uint amount = userBalance[msg.sender];
        userBalance[msg.sender] = 0;
        if( ! (msg.sender.call.value(amount)() ) ){
            throw;
        }
    }   

    function withdrawBalance_fixed_2(){
        // send() and transfer() are safe against reentrancy
        // they do not transfer the remaining gas
        // and they give just enough gas to execute few instructions    
        // in the fallback function (no further call possible)
        msg.sender.transfer(userBalance[msg.sender]);
        userBalance[msg.sender] = 0;
    }   
   
}

```

<br />
<details><summary><code>Writing in Vim</code></summary>
  
<div align="center">
  <img src="https://github.com/HarshDubeyDU/Blockchain/assets/87745474/77db2f2f-5bc5-4e1d-971c-937fc7f665b5" alt="Contract in Vim Editor" />
</div>

</details>

</details>

## <a name="surya">Surya</a>

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
<br />
Check Slither version

```bash
slither --version
```

</details>

# HyperLedger
## Fabric

### Installation (Linux)

<details>
  <summary><code>Create a new User</code></summary>
  <br />
  Create new User
  Provide password for the new User

  ```bash
    sudo adduser fabric
  ```
  
  <br />
  Add the user to the sudo groups

  ```bash 
    sudo usermod -aG sudo newuser
  ```

  <br />
  Login to "fabric" user

  ```bash
    su fabric
  ```

</details>

<details>
    <summary><code>Docker Installation</code></summary>
    Install curl

  ```bash
    sudo apt-get update
    sudo apt-get install curl
    curl --version
  ```

    Install Docker

</details>
