abstract class HelperMap {
  static void addToList<K, D>(K key, D data, Map<K, List<D>> map) {
    if (map[key] != null) {
      map[key]!.add(data);
    } else {
      map[key] = [data];
    }
  }

  static void addToSet<K, D>(K key, D data, Map<K, Set<D>> map) {
    if (map[key] != null) {
      map[key]!.add(data);
    } else {
      map[key] = {data};
    }
  }
}
