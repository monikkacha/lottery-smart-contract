pragma solidity ^0.8.10;

import "../node_modules/@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

abstract contract RandomGenerator is VRFConsumerBase {
    constructor(address _vrfCoordinator, address _link)
        VRFConsumerBase(_vrfCoordinator, _link)
    {}
}
