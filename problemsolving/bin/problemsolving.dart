import 'package:problemsolving/problemsolving.dart';

void main(List<String> arguments) {
  var result = isIsomorphic("egg", "add");
  print(result);
}
/* 
bool isPalindrome(int x) {
  if (x < 10 && x > 0) {
    return true;
  }

  var numText = x.toString();
  String result = '';
  for (var i = numText.length - 1; i >= 0; i--) {
    result += numText[i];
    print(numText[i]);
  }
  if (result == numText) {
    return true;
  }
  return false;
}
 */