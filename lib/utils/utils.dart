import 'dart:math';

List<T> getRandomElements<T>(List<T> list, int n) {
  // Check if n is greater than the list length
  if (n > list.length) {
    throw Exception('n cannot be greater than the length of the list');
  }

  // Create a random number generator
  Random random = Random();

  // Shuffle the list
  List<T> shuffledList = List.from(list)..shuffle(random);

  // Return the first n elements from the shuffled list
  return shuffledList.take(n).toList();
}
