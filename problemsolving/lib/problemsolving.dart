// make array consecutive solution
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
