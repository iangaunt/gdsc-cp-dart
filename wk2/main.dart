import 'dart:math';

void main() {
    List<int> numbers = [];

    for (int i = 0; i < 100; i++) {
        numbers.add(Random.secure().nextInt(100));
    }

    print("\n\n\n");
    print(numbers);
    
    for (int i = 0; i < numbers.length; i++) {
        int smallest = -1;

        for (int j = i; j < numbers.length; j++) {
            if (smallest == -1 || numbers[j] < numbers[smallest]) {
                smallest = j;
            }
        }

        int temp = numbers[i];
        numbers[i] = numbers[smallest];
        numbers[smallest] = temp;
    }

    print(numbers);
}



































































