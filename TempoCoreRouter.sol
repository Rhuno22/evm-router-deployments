// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract TempoCoreRouter {
    uint256 public activeRouteId;
    uint256 public totalRoutedCalls;
    mapping(uint256 => address) public routeOperators;

    event RouteUpdated(uint256 indexed routeId, address indexed operator);

    constructor(uint256 _initialRoute) {
        activeRouteId = _initialRoute;
        routeOperators[_initialRoute] = msg.sender;
    }

    function switchTempoRoute(uint256 _newRouteId) external {
        activeRouteId = _newRouteId;
        totalRoutedCalls += 1;
        routeOperators[_newRouteId] = msg.sender;
        emit RouteUpdated(_newRouteId, msg.sender);
    }
}
