
// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract VOHCoinERC20{
    event Transfer(address indexed from, address indexed to, uint nokens );
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    string public constant name = "VOH Coin";
    string public constant symbol = "VOHN";
    uint8 public constant decimals = 18;

    mapping(address => uint256) balances;

    mapping(address => mapping (address => uint256)) allowed;

    uint256 totalSupply_;

    constructor (uint total){
        totalSupply_= total;
        balances[msg.sender]=totalSupply_;
    }
    function balanceOf(address tokenOwner)public view returns(uint){
    return balances[tokenOwner];
    }
    function totalSupply() public view returns (uint256) {
      return totalSupply_;
    }
    function transfer(address receiver, uint numTokens) public returns (bool) {
    require(numTokens <= balances[msg.sender]);
    balances[msg.sender] -= numTokens; // token balance is getting deducted
    balances[receiver] += numTokens; // token balace is reciever
    emit Transfer(msg.sender, receiver, numTokens);
    return true;
    }

    function approve(address delegate, uint numTokens) public returns(bool) {

    allowed[msg.sender][delegate]= numTokens;

    emit Approval(msg.sender, delegate, numTokens);

    return true;

    }
    function allowance(address owner, address delegate) public view returns(uint){
    return allowed[owner][delegate];
    }
    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
    require(numTokens <= balances[owner]);
    require(numTokens <= allowed[owner][msg.sender]);
    balances[owner] -= numTokens;
    allowed[owner][msg.sender] -= numTokens;
    balances[buyer] += numTokens;
    emit Transfer(owner, buyer, numTokens);
    return true;
}
}
