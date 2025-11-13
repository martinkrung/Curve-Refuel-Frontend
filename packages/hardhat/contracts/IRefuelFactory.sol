// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title IRefuelFactory
 * @notice Interface for the FXSwap Refuel Factory Contract
 * @dev Generated from fxswap-refuel Solidity mocks
 */
interface IRefuelFactory {
    // Events
    event RefuelDeployed(
        address indexed refuel_contract,
        address indexed owner,
        address indexed fee_recipient,
        uint256 timestamp
    );
    event BlueprintUpdated(address old_blueprint, address indexed new_blueprint, uint256 timestamp);
    event OwnershipTransferred(address indexed previous_owner, address indexed new_owner);
    event FeesWithdrawn(
        address indexed token,
        address indexed recipient,
        uint256 amount,
        uint256 timestamp
    );

    // Public state variable getters
    function owner() external view returns (address);
    function blueprint() external view returns (address);
    function deployment_count() external view returns (uint256);
    function deployments(uint256 deployment_id) external view returns (address);

    // External functions
    function deploy_refuel(address owner_address, address fee_recipient_address) external returns (address);
    function deploy_refuel_simple(address owner_address) external returns (address);
    function update_blueprint(address new_blueprint) external;
    function withdraw_fees(address token, address recipient, uint256 amount) external;
    function withdraw_all_fees(address token, address recipient) external;
    function transfer_ownership(address new_owner) external;
    function get_deployment(uint256 deployment_id) external view returns (address);
    function get_fee_balance(address token) external view returns (uint256);
}
