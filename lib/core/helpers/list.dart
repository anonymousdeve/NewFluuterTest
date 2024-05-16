extension ShuffleList<T> on List<T> {
  List<T> shuffled() {
    List<T> newList = List.of(this); // Create a copy of the original list
    newList.shuffle(); // Shuffle the copy
    return newList; // Return the shuffled list
  }
}
