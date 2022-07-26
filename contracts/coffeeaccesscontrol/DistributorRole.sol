pragma solidity ^0.4.24;
//pragma solidity ^0.5.16;


// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'DistributorRole' to manage this role - add, remove, check
contract DistributorRole {
  //**LVC - 
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  //**LVC - 
  event DistributorAdded(address indexed account);
  //**LVC - 
  event DistributorRemoved(address indexed account);

  // Define a struct 'distributors' by inheriting from 'Roles' library, struct Role
  //**LVC - 
  Roles.Role private distributors;

  // In the constructor make the address that deploys this contract the 1st distributor
  constructor() public {
    //**LVC - 
    _addDistributor(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyDistributor() {
    //**LVC - 
    require(isDistributor(msg.sender));
    _;
  }

  // Define a function 'isDistributor' to check this role
  function isDistributor(address account) public view returns (bool) {
    //**LVC -  
    return distributors.has(account);
  }

  // Define a function 'addDistributor' that adds this role
  function addDistributor(address account) public onlyDistributor {
    //**LVC - 
    _addDistributor(account);
  }

  // Define a function 'renounceDistributor' to renounce this role
  function renounceDistributor() public {
    //**LVC - 
    _removeDistributor(msg.sender);
  }

  // Define an internal function '_addDistributor' to add this role, called by 'addDistributor'
  function _addDistributor(address account) internal {
    //**LVC - 
    distributors.add(account);
    //**LVC - 
    emit DistributorAdded(account);
  }

  // Define an internal function '_removeDistributor' to remove this role, called by 'removeDistributor'
  function _removeDistributor(address account) internal {
    //**LVC - 
    distributors.remove(account);
    //**LVC - 
    emit DistributorRemoved(account);
  }
}