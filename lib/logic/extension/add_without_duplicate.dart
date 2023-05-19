extension AddWithoutDuplicate<T> on List<T> {
  addWithoutDuplicate(T item) {
    final found = any((element) => element == item);
    if (!found) add(item);

    /// adds element to the list if in the list doesn't have same element with
    /// this element
  }
}

/** any(element){} - method
 * Checks whether any element of this iterable satisfies test.
    Checks every element in iteration order, and returns true
    if any of them make test return true, otherwise returns false
 */
