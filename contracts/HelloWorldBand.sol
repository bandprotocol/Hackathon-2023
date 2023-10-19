pragma solidity ^0.8.0;

interface IFutureBridge {
    struct Result {
        string clientID;
        uint64 oracleScriptID;
        bytes params;
        uint64 askCount;
        uint64 minCount;
        uint64 requestID;
        uint64 ansCount;
        uint64 requestTime;
        uint64 resolveTime;
        uint8 resolveStatus;
        bytes result;
    }

    function verify(address rAddress, uint256 s, bytes32 messageHash) external view returns (bool);
}

contract HelloWorldBand {
    struct Result {
        string text;
    }

    IFutureBridge public bridge;
    uint64 public constant ansCount = 1;
    uint64 public oracleScriptID;
    string public text;

    constructor(IFutureBridge _bridge, uint64 _oracleScriptID) {
        bridge = _bridge;
        oracleScriptID = _oracleScriptID;
    }

    function setText(address rAddress, uint256 signature, bytes memory message) external {
        require(
            bridge.verify(rAddress, signature, keccak256(abi.encodePacked(uint8(2), message))),
            "feedPrices: Verification fail"
        );

        IFutureBridge.Result memory r = abi.decode(message, (IFutureBridge.Result));

        require(r.resolveStatus == 1,"feedPrices: Request not successfully resolved");
        require(r.oracleScriptID == oracleScriptID, "feedPrices: Oracle Script ID not match");
        require(r.ansCount >= ansCount, "feedPrices: Ask Count too low");

        Result memory result = abi.decode(r.result, (Result));
        text = result.text;
    }
}
