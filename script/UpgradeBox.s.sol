// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {BoxV1} from "../src/BoxV1.sol";
 
contract UpgradeBox is Script {
    function run() external returns(address){
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid);
        
        vm.startBroadcast();
        BoxV2 newBox = new BoxV2();
        vm.stopBroadcast();
        
        address proxy = upgradeBox(mostRecentlyDeployed, address(newBox));
        return proxy;
    }

    function upgradeBox(address _proxyAddress, address _newBox) public returns (address) {
        vm.startBroadcast();
        BoxV1 proxy = BoxV1(_proxyAddress);
        proxy.upgradeToAndCall(address(_newBox), "");
        vm.stopBroadcast(); 

        return address(proxy);
    }
}