// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {ERC197Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Utils.sol";

contract DeployBox is Script {
    
    function run() external returns (address) {
        address proxy = deployBox();
        return proxy;
    }

    function deployBox() public returns (address) {
        vm.startBroadcast();
        BoxV1 box = new BoxV1();
        ERC197Proxy proxy = new ERC197Proxy(address(box), "");
        vm.stopBroadcast();

        return proxy;
    }
}