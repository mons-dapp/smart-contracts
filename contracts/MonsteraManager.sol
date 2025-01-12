// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import '@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol';
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/access/extensions/AccessControlEnumerable.sol';

contract MonsteraManager is Ownable, AccessControlEnumerable {
  IERC20 private token;

  bool public withdrawEnable;
  uint256 public maxWithdrawAmount; // maximum amount on 1 time withdraw
  bytes32 public constant WITHDRAWER_ROLE = keccak256('WITHDRAWER_ROLE');

  function setWithDrawEnable(bool _isEnable) public onlyOwner {
    withdrawEnable = _isEnable;
  }

  function setMaxWithdrawAmount(uint256 _maxAmount) public onlyOwner {
    maxWithdrawAmount = _maxAmount;
  }

  function setToken(IERC20 _token) public onlyOwner {
    token = _token;
  }

  constructor() Ownable(msg.sender) {
    _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
  }

  function withdraw(uint256 _amount, address _to) external onlyWithdrawer {
    require(withdrawEnable, 'Withdraw is not available');
    require(_amount <= maxWithdrawAmount, 'Exceed maximum amount');

    token.transfer(_to, _amount);
  }

  function deposit(uint256 _amount) external {
    require(
      token.balanceOf(msg.sender) >= _amount,
      'Insufficient account balance'
    );
    SafeERC20.safeTransferFrom(token, msg.sender, address(this), _amount);
  }

  /**
   * Modifiers
   */

  modifier onlyWithdrawer() {
    // Only owner or person who has WITHDRAWER_ROLE
    require(
      owner() == msg.sender || hasRole(WITHDRAWER_ROLE, msg.sender),
      'Caller is not a withdrawer'
    );
    _;
  }
}
