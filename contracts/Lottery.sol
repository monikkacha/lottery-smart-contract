pragma solidity ^0.8.10;
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "../node_modules/@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import "../node_modules/@openzeppelin/contracts/utils/Address.sol";
import "../node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Lottery is Ownable {
    using EnumerableSet for EnumerableSet.AddressSet;
    using Address for address;
    using SafeMath for uint256;

    enum LotteryState {
        Open,
        Closed,
        Finished
    }

    mapping(uint256 => EnumerableSet.AddressSet) entries;
    uint256[] numbers;
    LotteryState public state;
    uint256 public numberOfEntries;
    uint256 public entryFee;
    uint256 public ownerCut;
    uint256 public winningNumber;
    address randomNumberGenreator;
    bytes32 randomNumberRequestId;

    event LotteryStateChanged(LotteryState newChangd);
    event NewEntry(address player, uint256 number);
    event NumberRequested(bytes32 requestId);
    event NumberDrawn(bytes32 requestId, uint256 winningNumber);

    modifier isState(LotteryState _state) {
        require(state == _state, "Wrong state for this action");
        _;
    }

    // function submitNumber (uint _number) public payable isState (LotteryState.Open) {
    //     require(msg.value >= entryFee , "Minimum entry fee required");
    //     require(entries[_number].add(msg.sender), "Can not submit the number more than once");
    //     numbers.push(_number)
    //     numberOfEnteries++;
    //     payable(owner()).transfer(ownerCut)
    //     emit NewEntry(msg.sender , _number);
    // }
}
