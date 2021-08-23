pragma solidity >=0.4.22 <0.9.0;
contract MyContract {

    uint256 now = 1;
    string username;
    string proof;
    string next;
    
    string[]  nextList = new string[](5);

    constructor() public {
        username = "user";
        proof = "myProof";
        next = "A";
        nextList = ["A","B","C","D","E"];
    }


    function getUser() public view returns(string memory ) {
        return username;
    }

    function getProof() public view returns(string memory) {
        return proof;
    }

    function getNext() public view returns(string memory) {
        return next;
    }

    function set(string memory _username, string memory _proof) public {
        username = _username;
        proof = _proof;
        next = nextList[now++ % 5];
    }
}