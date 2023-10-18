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

	uint64 public constant ansCount = 1;
	uint64 public constant oracleScriptID = 3;
	IFutureBridge public bridge;
	string public text;

	constructor(IFutureBridge _bridge) {
		bridge = _bridge;
	}

	function setText(address rAddress, uint256 s, bytes memory data) external {
		require(
			bridge.verify(rAddress, s, keccak256(abi.encodePacked(uint8(2), data))),
			"feedPrices: Verification fail"
		);

		IFutureBridge.Result memory r = abi.decode(data, (IFutureBridge.Result));

		require(r.resolveStatus == 1,"feedPrices: Request not successfully resolved");
		require(r.oracleScriptID == oracleScriptID, "feedPrices: Oracle Script ID not match");
		require(r.ansCount >= ansCount, "feedPrices: Ask Count not >=");

		Result memory result = abi.decode(r.result, (Result));
        	text = result.text;
	}
}
