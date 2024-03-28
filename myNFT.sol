// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@5.0.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@5.0.0/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts@5.0.0/access/Ownable.sol";

contract WolfAI is ERC721, ERC721Pausable, Ownable {
    uint256 private _nextTokenId;

    constructor(address initialOwner) ERC721("WolfAI", "wolfAI") Ownable(initialOwner) {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://green-slow-thrush-705.mypinata.cloud/ipfs/Qmasgii8aiFqmRV7AxAHvmbUPXTSBteh7ryeraCuctjaEi?_gl=1*128mzau*_ga*MTI3NDYwOTI0NC4xNjk5MDExMzk5*_ga_5RMPXG14TE*MTY5OTAxMTM5OC4xLjEuMTY5OTAxMjA3My40Ni4wLjA.";
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity
    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Pausable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }
}
