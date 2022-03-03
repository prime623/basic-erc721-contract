//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";

contract PrimeNFT is ERC721, Ownable {
    uint256 public counter;
    uint256 public maxTokens;
    // string public baseURI = "https://ipfs.io/ipfs/";

    constructor() ERC721("PrimeNFT", "PNFT") {
        maxTokens = 10;
    }

    function mint(address to, uint256 tokenId) public onlyOwner {
        require(counter < maxTokens, "Token limit reached.");
     // Ne znam sta da napisem pod _data pa nisam uspio pokrenit funkciju  
     // _safeMint(to, tokenId, _data);
        _mint(to, tokenId);
        counter++;
    }

    function transfer(address from,
        address to,
        uint256 tokenId) internal onlyOwner {
           // safeTransferFrom(from, to, tokenId, _data);
            _transfer(from, to, tokenId);
        }

    function burn(uint256 tokenId) public onlyOwner {
        _burn(tokenId);
        counter--;
    }

    // shvatio sam da je ova funkcija nepotrebna

    /* function _balanceOf(address owner) public view returns (uint256 balance) {
        return balanceOf(owner);
    } 
    */

    function totalSupply() public view returns(uint) {
        return counter;
    }

}
 