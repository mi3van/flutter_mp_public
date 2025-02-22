class ListWithNextPageToken<T> {
  final String? nextPageToken;
  final List<T> list;
  ListWithNextPageToken(this.list, this.nextPageToken);
}
