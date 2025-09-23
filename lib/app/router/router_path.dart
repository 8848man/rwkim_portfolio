enum RouterPath {
  home('home', '/home');

  const RouterPath(
    this.name,
    this.path,
  );
  final String name;
  final String path;
}
