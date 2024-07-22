abstract class NavigationService {
  void goBack({final Uri? fallbackUri});
  void pop<T>({final T? data});
  void push(final String uri);
  void replaceWith(final Uri uri);
  void replaceWithNamed(final Uri uri);
}
