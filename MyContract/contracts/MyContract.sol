pragma solidity >=0.4.22 <0.9.0;
contract MyContract {
    uint mod = 70;
    uint roundNow;
    bool nxtRound;
    uint[] Gradient = new uint[](mod);
    // w[10][4],v[3][10] in the training model

    string Encrypted;
    
    uint[] average = new uint[](mod);
    uint[] totalGra = new uint[](mod);
    uint[] totalRand = new uint[](mod);
    
    uint totalRound = 20;
    bool isEnd;
    
    string next;
    string[]  nextList = new string[](5);

    constructor() public {
        roundNow = 1;
        Gradient = [0];
        totalGra = [0];
        // Gradient with random number
        totalRand = [0];
        // Total of random number
        average = [0];

        Encrypted = "myEncrypted"; 
        // To reveive encrypted P
        nextList = ["A","B","C","D","E"];
        next = "NULL";
        nxtRound = false;
        isEnd = false;
    }


    function getGradient() public view returns(uint[] memory) {
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

    function set(uint[] memory _Gradient, string memory _Encrypted) public {
        if(_Gradient.length != mod) {
            isEnd = true;
            // Wrong number of gradient
        }

        Gradient = _Gradient;
        for(uint i = 0; i < mod; i++) {
            totalGra[i] += _Gradient[i];
        }

        Encrypted = _Encrypted;
        next = nextList[roundNow++ % 5];
    }

    function getNow() public view returns (uint) {
        return roundNow;
    }

    function checkEnd() public returns (bool) {
        if(roundNow == totalRound)
            isEnd = true;
        return isEnd;
    }

    function hashCompare(string memory a, string memory b) public returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }
    // To judge if a == b

    function setTotalRand(uint[] memory Rand) public returns (uint[] memory) {
        if(hashCompare(next, "A")) {
            totalRand = Rand;
            for(uint i = 0; i < mod; i++) {
                totalGra[i] -= totalRand[i];
                // calc the real Gradient
            } 
            for(uint i = 0; i< mod; i++) {
                average[i] = totalGra[i] / nextList.length;
            }    
                nxtRound = true;
                return average;
        }
    }

    function clear() public{
        totalGra = [0];
        totalRand = [0];
        average = [0];
        nxtRound = false;
    }
}