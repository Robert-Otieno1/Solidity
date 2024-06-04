pragma solidity ^0.8.20;

contract Crud {

    struct Item{
        string name;
        string age;
        uint256 id;
        bool verified; 
    }

    Item[] public items;
    uint256 public nextId = 1;

    function create (string memory _name, string memory _age) public{
        items.push(Item(_name, _age, nextId, true));
        nextId++;
    }

    function readLength() public view returns(uint256){
        return items.length;
    }

    function find(uint256 id) internal view returns (uint256){
        for(uint256 i=0; i < items.length; i++){
            if(items[i].id == id){
                return i;
            }
        }
        revert ('does not exist');
    }

    function update(string memory _name, string memory _age, uint256 _id) public {
     uint256 i = find(_id);
     items[i].name = _name; 
     items[i].age = _age;
    }
 
 function remove (uint256 id) public { 
    uint256 i = find(id);
    items[i] = items[items.length - 1];
    items.pop();
 }
}