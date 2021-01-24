const String BASE_URL = 'https://pokeapi.co/api/v2';

class Endpoints {
  static final user = _User();
}

class _User {
  final list = "/pokemon";

  // Example with some path param
  // final courseDropDown = "/users/${PathParams.USER_ID}";
}
