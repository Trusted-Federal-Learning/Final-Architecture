pragma solidity >=0.4.22 <0.9.0;
contract MyContract {
    uint mod = 70;
    uint roundNow;

    uint[] Gradient = new uint[](mod);
    // w[10][4],v[3][10] in the training model

    
    uint[] average = new uint[](mod);
    uint[] totalGra = new uint[](mod);
    
    uint totalRound = 20;
    bool isEnd;
    
    string next;
    string[]  nextList = new string[](5);
    string url;

    constructor() public {
        roundNow = 1;
        Gradient = [0];
        // Gradient with random number
        
        average = [301773,960152,965252,160122,506657,307787,246430,84577,771950,328064,539807,604264,539513,158807,396891,543082,439225,648467,964856,762278,710682,543391,38317,310180,19108,23046,473385,685787,942947,123262,396323,461729,892732,761709,601018,855990,339139,194702,883763,388658,525110,349793,788016,789063,687740,821236,785212,623507,793732,492645,836781,742656,865892,421106,575685,9226,865192,971045,110261,469727,195078,709763,105550,964833,819437,709790,186865,378151,114592,647022];

        nextList = ["A","B","C","D","E"];
        next = "A";
        isEnd = false;
    }


    function getGradient() public view returns(uint[] memory) {
        return Gradient;
    }


    function getNext() public view returns(string memory) {
        return next;
    }

    function getUrl() public view returns(string memory) {
        return url;
    }

    function getNow() public view returns (uint) {
        return roundNow;
    }

    function checkEnd() public returns (bool) {
        if(roundNow == totalRound)
            isEnd = true;
        return isEnd;
    }


    function set(uint[] memory _Gradient, string memory _url) public {
        if(_Gradient.length != mod) {
            isEnd = true;
            // Wrong number of gradient
        }
        url = _url;
        Gradient = _Gradient;
        for(uint i = 0; i < mod; i++) {
            totalGra[i] += _Gradient[i];
        }
        next = nextList[roundNow++ % 5];
    }

    

    function hashCompare(string memory a, string memory b) public returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }
    // To judge if a == b

    function setAverage(uint[] memory ave) public returns (uint[] memory) {
        if(hashCompare(next, "A")) {
            average = ave;
            roundNow++;
            return average;
        }
    }


}