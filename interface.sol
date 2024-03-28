// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IStorage{
    function store(uint value) external;
    function retrieve() external view returns (uint);
}

contract simpleStorage is IStorage{
    uint private data;

     function store(uint256 value) external override {
        data = value;
    }

    function retrieve() external view override returns (uint256) {
        return data;
    }
}

// Interacting with the implemented contract
contract StorageUser {
    IStorage private storageContract;

    constructor(IStorage _storageContract) {
        storageContract = _storageContract;
    }

    function storeValue(uint256 value) external {
        storageContract.store(value);
    }

    function retrieveValue() external view returns (uint256) {
        return storageContract.retrieve();
    }
}