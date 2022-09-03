import '../models/characters.dart';
import '../models/quotes.dart';
import '../web_services/characters_web.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<dynamic>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) => Data.fromJson(character)).toList();
  }
  Future<List<Quote>> getAllCharactersQuotes(String charName ) async {
    final quotes = await charactersWebServices.getAllCharactersQuotes(charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }
}
