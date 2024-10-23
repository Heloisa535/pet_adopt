class Favorites {
  static final List<String> _favoritePets = []; 

  static void addFavorite(String petName) {
    if (!_favoritePets.contains(petName)) {
      _favoritePets.add(petName);
    }
  }

  static void removeFavorite(String petName) {
    _favoritePets.remove(petName);
  }

  static bool isFavorite(String petName) {
    return _favoritePets.contains(petName);
  }

  static List<String> getFavorites() {
    return _favoritePets;
  }
}
