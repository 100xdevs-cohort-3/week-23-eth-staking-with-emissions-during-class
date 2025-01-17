// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/OrcaCoin.sol";

contract OrcaCoinTest is Test {
    OrcaCoinContract orcaCoin;

    function setUp() public {
        orcaCoin = new OrcaCoinContract(address(this));
    }

    function testInitialSupply() public view {
        assert(orcaCoin.totalSupply() == 0);
    }

    function testFailMint() public {
        vm.startPrank(0xfF1D73Ea47222386fE482BAadb1f3d5755ea55c9);
        orcaCoin.mint(0xfF1D73Ea47222386fE482BAadb1f3d5755ea55c9, 10);
    }

    function testMint() public {
        orcaCoin.mint(0xfF1D73Ea47222386fE482BAadb1f3d5755ea55c9, 10);
        assert(orcaCoin.balanceOf(0xfF1D73Ea47222386fE482BAadb1f3d5755ea55c9) == 10);
    }
    
    function testChangeStakingContract() public {
        orcaCoin.updateStakingContract(0xfF1D73Ea47222386fE482BAadb1f3d5755ea55c9);
        vm.startPrank(0xfF1D73Ea47222386fE482BAadb1f3d5755ea55c9);
        orcaCoin.mint(0xfF1D73Ea47222386fE482BAadb1f3d5755ea55c9, 10);
        assert(orcaCoin.balanceOf(0xfF1D73Ea47222386fE482BAadb1f3d5755ea55c9) == 10);
    }

}
