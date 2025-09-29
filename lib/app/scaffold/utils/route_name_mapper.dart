String routeNameMapper(String title) {
  switch (title) {
    case '저에 대해서' || 'About me':
      return 'aboutMe';
    case '성향' || 'Tendency':
      return 'tendency';
    case '보유 역량' || 'Skills':
      return 'skill';
    case '프로젝트' || 'Projects':
      return 'projects';
    case '개발자로서 매력 포인트' || 'AppealPoint as Dev':
      return 'appealPoint';
    default:
      throw Exception('Unknown title: $title');
  }
}
