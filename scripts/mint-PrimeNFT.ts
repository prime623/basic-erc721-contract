import { ethers } from "hardhat";
import {expect} from "chai";


async function main() {
    const Contract = await ethers.getContractFactory("PrimeNFT");
    const contract = await Contract.deploy();
    await contract.deployed();

        
    const ownerBalance1 = await contract.balanceOf(contract.address);
    expect(await contract.totalSupply()).to.equal(ownerBalance1);
    console.log("Owner's balance is equal to: " + ownerBalance1);
        

        
    const minted = await contract.mint(contract.address, 1);
    console.log("Your NFT has just been minted.");
        
    

        
    const ownerBalance2 = await contract.balanceOf(contract.address);
    expect(await contract.totalSupply()).to.equal(ownerBalance2);
    console.log("Owner's balance is equal to: " + ownerBalance2);
        
    }

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });