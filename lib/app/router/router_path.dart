enum RouterPath {
  indexPath('index', '/index'),
  aboutMePath('aboutMe', '/aboutMe'),
  tendencyPath('tendency', '/tendency'),
  skillPath('skill', '/skill'),
  projectsPath('projects', '/projects'),
  appealPointPath('appealPoint', '/appealPoint');

  const RouterPath(this.name, this.path);
  final String name;
  final String path;
}
