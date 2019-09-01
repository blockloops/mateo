pragma solidity 0.5.10;

    contract BirthCertificate {
    
    address payable owner;
    string name;
    string date;
    string local;
    string gender;
    string filiation;

    constructor(address payable _owner, string memory _name, string memory _date, string memory _local, string memory _gender, string memory _filiation) public {
    owner = _owner;
    name = _name;
    date = _date;
    local = _local;
    gender = _gender;
    filiation = _filiation;
    emit Time(now);
    }
    event Time(uint time);
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function () external
        payable {}
    
    function getBalances () public view returns(uint) {
    return(address(this).balance);
    }
    
    function withdrawAll()
        onlyOwner
        public {
        msg.sender.transfer(address(this).balance);
    }
    
    function withdraw50percent()
        onlyOwner
        public {
        msg.sender.transfer((address(this).balance)/2);
    }
    
    function withdraw10percent()
        onlyOwner
        public {
        msg.sender.transfer((address(this).balance)/10);
    }

}
