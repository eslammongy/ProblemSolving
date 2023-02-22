// make array consecutive solution

import 'dart:collection';
import 'dart:core';
import 'dart:ffi';

int findCountOfMissingNum(List<int> statues) {
  if (statues.length == 1) {
    return 0;
  }

  var countMissNum = 0;
  // first we need to make sure that the array are sorted
  for (var currentIndex = 0; currentIndex < statues.length; currentIndex++) {
    var smallestValue = currentIndex;
    for (var i = currentIndex + 1; i < statues.length; i++) {
      if (statues[i] < statues[smallestValue]) {
        smallestValue = i;
      }
    }

    var temp = statues[currentIndex];
    statues[currentIndex] = statues[smallestValue];
    statues[smallestValue] = temp;
  }
  // then we can find the count of missing numbers
  for (var j = 0; j < statues.length - 1; j++) {
    if (statues[j + 1] - statues[j] > 1) {
      countMissNum += statues[j + 1] - statues[j] - 1;
    }
  }
  print(statues);
  return countMissNum;
}

// calculate shape area solution
int getShapeArea(int n) {
  if (n < 0) {
    return 0;
  }

  return (n * n) + (n - 1) * (n - 1);
}

/* 
function almostIncreasingSequence(sequence) {
  let invalidItemsCount = 0;
  
  for (let i = 1; i < sequence.length; i++) {
    if (sequence[i] <= sequence[i-1]) {
      invalidItemsCount++;
      if (invalidItemsCount > 1) return false;
      if (sequence[i] <= sequence[i-2] && sequence[i+1] <= sequence[i-1]) return false;
    }
  }
  
  return true;
}
 */
dynamic solution(List<int> sequence) {
  if (sequence.length == 1) {
    return true;
  }
// var sequence = [3, 6, 5, 8, 10, 20, 15];
  var countRemovingItems = 0;
  for (var i = 1; i < sequence.length; i++) {
    if (sequence[i] <= sequence[i - 1]) {
      countRemovingItems++;
    }
    if (countRemovingItems > 1) {
      return false;
    }
    if (sequence[i] <= sequence[i - 1] && sequence[i + 1] <= sequence[i - 1]) {
      return false;
    }
  }

  return true;
}

dynamic solution2(List<int> sequence) {
  if (sequence.length == 1) {
    return true;
  }
// var sequence = [1, 2, 1, 2]; sequence: [1, 2, 3, 4, 5, 3, 5, 6] sequence: [40, 50, 60, 10, 20, 30] = 1, 3, 2
  var countInvalidItems = 0;
  var sumCheck = 1;
  for (var i = 1; i < sequence.length; i++) {
    if (i == sequence.length - 1) {
      sumCheck = 0;
    }
    if (sequence[i] <= sequence[i - 1]) {
      countInvalidItems++;
    }
    if (countInvalidItems > 1) {
      return false;
    }
    if (sequence[i] <= sequence[i - 1] &&
        sequence[i - 1] >= sequence[i + sumCheck] &&
        countInvalidItems > 1) {
      return false;
    }
    if (sequence[i] >= sequence[i + sumCheck] &&
        sequence[i - 1] >= sequence[i] &&
        countInvalidItems >= 1) {
      return false;
    }
  }

  return true;
}

bool isIsomorphic(String s, String t) {
  if (s.length != t.length) return false;

  String currentChar;
  String nextChar;

  // var charMap = <int, String>{};if (currentChar == nextChar && t[i] != t[i + 1])
  for (var i = 0; i < s.length - 1; i++) {
    //charMap.putIfAbsent(i, () => s[i]);
    currentChar = s[i];
    nextChar = s[i + 1];
//"paper", t = "title"
    if (currentChar != nextChar && t[i] != t[i + 1]) {
      continue;
    } else if (currentChar == nextChar && t[i] != t[i + 1]) {
      return false;
    } else {
      continue;
    }
  }

  return true;
}
bool isIsomorphic2(String s, String t) {
  HashSet<String> se = HashSet<String>();
  Map<String, String> map = <String, String>{};
  int n = s.length;
  for (int i = 0; i < n; i++) {
    if (!map.containsKey(s[i])) {
      if (se.contains(t[i])) return false;
      map[s[i]] = t[i];
      se.add(t[i]);
    } else if (map[s[i]] != t[i]) {
      return false;
    }
  }
  return true;
}
