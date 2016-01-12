var sortCandidates = function(result) {
  return result.sort(function(a, b) {
    return b.count - a.count;
  });
};

var findVote = function(result, vote) {
  var index = 0;
  var voteObject;
  while (index < result.length && !voteObject) {
    if (result[index].vote === vote) {
      voteObject = result[index];
    };
    index++;
  }
  return voteObject;
};

exports.tally = function(votes) {
  var result = [];

  var count = function(votes) {
    if ((result.length > 2) && ((result[0].count - (result[1].count + result[2].count)) >= votes.length)) {
      return [result[0].vote]
    };
    if (votes.length === 0) {
      var thirdPlace = result[2].count;
      var index = 3;
      while (index < result.length && result[index].count === thirdPlace) {
        index ++;
      }

      return result.splice(0, index).
        map(function(candidate) { return candidate.vote }).sort();
    }
    var vote = votes.shift();
    var voteObject = findVote(result, vote);
    if(!voteObject) {
      voteObject = {vote: vote, count: 0};
      result.push(voteObject);
    };
    ++voteObject.count;
    sortCandidates(result);
    return count(votes);
  };

  return count(votes);
};
