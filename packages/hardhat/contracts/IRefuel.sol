// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title IRefuel
 * @notice Interface for the FXSwap Refuel Contract
 * @dev Generated from fxswap-refuel Solidity mocks
 */
interface IRefuel {
    // Events
    event Initialized(address indexed owner, uint256 timestamp);
    event PoolSet(address indexed pool, uint256 timestamp);
    event RefuelAmountSet(uint256 amount, uint256 timestamp);
    event ThresholdSet(uint256 threshold, uint256 timestamp);
    event Refueled(
        uint256 lp_amount,
        uint256 token0_amount,
        uint256 token1_amount,
        uint256 donated_lp,
        uint256 fee_amount,
        uint256 timestamp
    );
    event FeePaid(address indexed recipient, uint256 amount, uint256 timestamp);
    event OwnershipTransferred(address indexed previous_owner, address indexed new_owner);

    // Public state variable getters
    function initialized() external view returns (bool);
    function owner() external view returns (address);
    function pool() external view returns (address);
    function refuel_lp_amount() external view returns (uint256);
    function donation_share_threshold() external view returns (uint256);
    function fee_bps() external view returns (uint256);
    function fee_recipient() external view returns (address);

    // External functions
    function initialize(address owner_address, address fee_recipient_address) external;
    function set_pool(address new_pool) external;
    function set_refuel_amount(uint256 lp_amount) external;
    function set_donation_threshold(uint256 threshold) external;
    function refuel() external returns (uint256);
    function withdraw_lp_tokens(uint256 amount) external;
    function withdraw_tokens(address token, uint256 amount) external;
    function transfer_ownership(address new_owner) external;
    function get_lp_balance() external view returns (uint256);
    function calculate_donation_share() external view returns (uint256);
}
