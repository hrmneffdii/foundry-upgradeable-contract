// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {BoxV2} from "../src/BoxV2.sol";

contract DeployAndUpgradeTest {
    DeployBox public deployer; 
    UpgradeBox public upgrader;

    address public OWNER = makeaddr("owner");
    address public proxy;

    function setUp() external {
        deployer = new DeployBox();
        upgrader = new UpgradeBox();
        proxy = deployer.deploy();
    }

    function testProxyStartAsBox1() external {
        vm.expectRevert();
        BoxV2(proxy).setNumber(3);
    }

    function testUpgrades() external {
        BoxV2 boxV2 = new BoxV2();

        upgrader.upgradeBox(proxy, address(boxV2));
        uint256 expectedValue = 2;
        assertEq(BoxV2(proxy).version(), expectedValue);

        BoxV2(proxy).setNumber(3);
        assertEq(BoxV2(proxy).number(), 3);
    }
}