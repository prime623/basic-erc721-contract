import { ethers } from "hardhat";
import { expect } from "chai";


describe("Token", function () {


  it("Should check the balance of the owner", async function () {
    const [owner] = await ethers.getSigners();
    const PrimeNFT = await ethers.getContractFactory("PrimeNFT");
    const primeNFT = await PrimeNFT.deploy();
    await primeNFT.deployed();

    
    const ownerBalance = await primeNFT.balanceOf(owner.address);
    expect(await primeNFT.totalSupply()).to.equal(ownerBalance);
    console.log("Owner's balance is equal to: " + ownerBalance);

  });


});
