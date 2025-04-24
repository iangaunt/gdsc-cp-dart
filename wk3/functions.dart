import 'dart:math';

int main() {
  int n = runner(25);
  print(n);
  print(reverse("Forwards"));

  print(is_prime(29));
  print(is_prime(30));
  print(remove_odds([1, 2, 3, 4, 5]));
  return 0;
}

int runner(int n) {
  for (int i = 0; i < n; i++) {
    print(i);
  }

  return n;
}

String reverse(String a) {
  String reversed = "";
  for (int i = 0; i < a.length; i++) {
    reversed = a[i] + reversed;
  }

  return reversed;
}

bool is_prime(int n) {
  for (int i = 2; i < sqrt(n).toInt(); i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

List<int> remove_odds(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] % 2 == 1) {
      arr.removeAt(i);
      i--;
    }
  }
  
  return arr;
}