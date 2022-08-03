pragma solidity >=0.4.22 <0.8.0;

contract Election {
    //Model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

// Store account that have voted
mapping(address => bool) public voters;
  //Reading/write Candidates
  mapping(uint => Candidate) public Candidates;

  //Store Candidates Count
  uint public CandidatesCount;

  constructor () public {
      addCandidate("BAT");
      addCandidate("Obidient");
      addCandidate("Atikulated");
    }

  function addCandidate (string memory _name) private {
    CandidatesCount ++;
    Candidates[CandidatesCount] = Candidate(CandidatesCount, _name, 0);
  }

  function vote (uint _candidateId) public {
    //Require that theyn have'nt voted before
    require(!voters[msg.sender]);

    //requre a valid candidate
    require(_candidateId > 0 && _candidateId <= CandidatesCount);


    //Record that voter has voted
    voters[msg.sender] = true;

    //update candidate vote cound
    Candidates[_candidateId].voteCount++; 
  }
}