pragma solidity >=0.4.22 <0.9.0;
contract MyContract {

    uint now;
    bool nxtRound;
    uint Gradient;
    string Encrypted;
    
    uint average;
    uint totalGra;
    uint totalRand;
    
    uint totalRound = 20;
    bool isEnd;

    
    string next;
    string[]  nextList = new string[](5);

    constructor() public {
        now = 1;
        Gradient = 0;
        totalGra = 0;
        // Gradient with random number
        totalRand = 0;
        // Total of random number
        average = 0;
        Encrypted = "myEncrypted"; 
        // To reveive encrypted P
        nextList = ["A","B","C","D","E"];
        next = "NULL";
        nxtRound = false;
        isEnd = false;
    }


    function getGradient() public view returns(uint) {
        return Gradient;
    }

    function getEncrypted() public view returns(string memory) {
        return Encrypted;
    }

    function getNext() public view returns(string memory) {
        return next;
    }

    function getNxtRound() public view returns(bool) {
        return nxtRound;
    }

    function set(uint _Gradient, string memory _Encrypted) public {
        Gradient = _Gradient;
        totalGra += _Gradient;
        Encrypted = _Encrypted;
        next = nextList[now++ % 5];
    }

    function getNow() public view returns (uint) {
        return now;
    }

    function checkEnd() public returns (bool) {
        if(now == totalRand)
            isEnd = true;
        return isEnd;
    }

    function hashCompare(string memory a, string memory b) public returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }
    // To judge if a == b

    function setTotalRand(uint Rand) public returns (uint){
        if(hashCompare(next, "A")){
            totalRand = Rand;
            totalGra -= totalRand;
            // calc the real Gradient
            average = totalGra / nextList.length;
            nxtRound = true;
            return average;
        }
    }

    function clear() public{
        totalGra = 0;
        totalRand = 0;
        average = 0;
        nxtRound = false;
    }
}