extension AppString on String {
  String get baseUrlNews => 'newsapi.org';
  String get baseUrl => '/v2/$this';
  String get baseUrlWithEverything => 'everything'.baseUrl;
  String get baseUrlWithTop => 'top-headlines'.baseUrl;
  String get getApiKey => '3f7e5cb7897d4c578df3b338cd4b57fa';
}
