pragma solidity >=0.4.22 <0.9.0;
 
contract MyContract {
  // 用于存储图片的哈希值
  string storedData;
 
  function set(string memory x) public {
    storedData = x;
  }
 
  function get() public view returns (string memory) {
    return storedData;
  }
}    