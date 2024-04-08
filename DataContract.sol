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
