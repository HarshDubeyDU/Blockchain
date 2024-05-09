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
    <br />
    Install curl

  ```bash
    sudo apt-get update
    sudo apt-get install curl
    curl --version
  ```

<br />
    Install Docker

  ```bash
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  ```

<br />
    Add Docker Repositories to APT sources

  ```bash
    sudo add-apt-repository “deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable”
  ```

<br />
    Update package database and Install Docker

  ```bash
    sudo apt-get update
    sudo apt-get install -y docker-ce
  ```

</details>

<details>
    <summary><code>GoLang</code></summary>
    <br />
    Install GoLang Package 

  ```bash
    curl -O https://storage.googleapis.com/golang/go1.11.linux-amd64.tar.gz
  ```
    
<br />
    Extract the package

  ```bash
    sudo tar xvf go1.11.linux-amd64.tar.gz
  ```

<br />
    Set the GOPATH
    
  ```bash
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
  ```
<details>
  <summary><code>Installation Image</code></summary>
  
  ![326421283-a472e4f7-2b5f-4916-a599-bb54b7b4b8a4](https://github.com/HarshDubeyDU/Blockchain/assets/87745474/10755f84-d07b-47bc-bbe2-90151dcef3a7)
  
  ![326421406-cd29a0f9-ad8d-40d0-b58e-44c424d1de05](https://github.com/HarshDubeyDU/Blockchain/assets/87745474/d10bb7ff-6832-42da-82e4-275ccbec8f60)
  
  ![326421345-9ac11685-78cd-4b57-b2e5-b48208548325](https://github.com/HarshDubeyDU/Blockchain/assets/87745474/279143db-ea2b-42ab-9ac1-c58ffa3eee49)

</details>
</details>

<details>
    <summary><code>Nodejs and npm</code></summary>
    <br />
    Download the installation script using curl
    
  ```bash
    curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
  ```
  
  <br />
    Run script under sudo and Install the nodejs
  
  ```bash
    sudo bash nodesource_setup.sh
    sudo apt-get install nodejs
  ```
</details>

<details>
    <summary><code>Python Installation</code></summary>
    <br />

  ```bash
    sudo apt-get install python2.7
  ```
<details>
  <summary><code>Installation Image</code></summary>
  
  ![326421449-c16b26ea-6f61-422b-b422-3ac8bd137437](https://github.com/HarshDubeyDU/Blockchain/assets/87745474/06a4122c-b8af-4e32-8424-cbfe2a11da17)

</details>
</details>


