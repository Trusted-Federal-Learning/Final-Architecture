pragma solidity >=0.4.22 <0.9.0;
contract MyContract {

    string username;
    string proof;

    constructor() public {
        username = "user";
        proof = "myProof";
    }


    function getUser() public view returns(string memory ) {
        return username;
    }

    function getProof() public view returns(string memory) {
        return proof;
    }

    function set(string memory _username, string memory _proof) public {
        username = _username;
        proof = _proof;
    }
}