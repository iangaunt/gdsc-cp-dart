import "dart:math";

void main() {
    List<int> numbers = [];
    for (int i = 0; i < 20; i++) {
        numbers.add(Random().nextInt(100));
    }

    print(numbers);
    quick_sort(numbers, 0, numbers.length - 1);
    print(numbers);

    List<int> sub = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
    print(max_subarray(sub));
}

int max_subarray(List<int> arr) {
    print(arr.toString());
    if (arr.length == 0) return 0;
    if (arr.length == 1) return arr[0];

    int mid = (arr.length / 2).toInt();

    int left = max_subarray(arr.sublist(0, mid));
    int right = max_subarray(arr.sublist(mid + 1, arr.length));

    int sum = 0;

    int max_left = -2000000;
    int max_right = -2000000;

    for (int i = mid; i >= 0; i--) {
        sum += arr[i];
        max_left = max(max_left, sum);
    }
    
    sum = 0;
    for (int i = mid + 1; i < arr.length; i++) {
        sum += arr[i];
        max_right = max(max_right, sum);
    }
    int combined = max_left + max_right;

    int m = max(max(left, right), combined);
    print(left.toString() + " : " + right.toString() + " : " + combined.toString());
    return m;
}

void quick_sort(List<int> arr, int begin, int end) {
    if (begin < end) {
        int partitionIndex = partition(arr, begin, end);

        quick_sort(arr, begin, partitionIndex - 1);
        quick_sort(arr, partitionIndex + 1, end);
    }
}

int partition(List<int> arr, int begin, int end) {
    int pivot = arr[((begin + end) / 2).toInt()];
    int i = begin;

    for (int j = begin; j < end; j++) {
        if (arr[j] <= pivot) {
            int swapTemp = arr[i];
            arr[i] = arr[j];
            arr[j] = swapTemp;

            i++;
        }
    }

    int swapTemp = arr[i];
    arr[i] = arr[end];
    arr[end] = swapTemp;

    return i;
}

List<int> merge_sort(List<int> a) {
    if (a.length <= 1) { return a; }

    return merge(
        merge_sort(a.sublist(0, (a.length / 2).toInt())),
        merge_sort(a.sublist((a.length / 2).toInt(), a.length))
    );
}

int fib(int n) {
    if (n <= 1) return 1;
    return fib(n - 1) + fib(n - 2);
}

List<int> merge(List<int> one, List<int> two) {
    if (one.length == 0) return two;
    if (two.length == 0) return one;

    int i = 0; 
    int j = 0;
    List<int> result = [];

    while (i < one.length || j < two.length) {
        if (i == one.length) {
            result.add(two[j]);
            j++;
        } else if (j == two.length) {
            result.add(one[i]);
            i++;
        } else {
            if (one[i] >= two[j]) {
                result.add(two[j]);
                j++;
            } else {
                result.add(one[i]);
                i++;
            }
        }
    }

    return result;
}