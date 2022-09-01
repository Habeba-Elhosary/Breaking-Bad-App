import 'package:breakingbad/data/models/characters.dart';
import 'package:breakingbad/data/web_services/characters_web.dart';
class Charactersrepository{
   late final Characterswebservices characterswebservices ;
   Charactersrepository(this.characterswebservices);

   Future<List<dynamic>> Getallcharacters() async{
     final characters = await characterswebservices.Getallcharacters();
     return characters.map((character) =>  character.fromJson(character)).toList();
   }
}
