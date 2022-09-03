import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../data/models/quotes.dart';
import '../data/repository/characters_rep.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
   List <dynamic> myCharacters =[];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  List <dynamic> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters){
      emit(CharactersLoaded(characters));
      myCharacters = characters ;
     }
    );
    return myCharacters;
  }
  void getQuotes(String charName){
  charactersRepository.getAllCharactersQuotes(charName).then((quotes){
      emit(QuotesLoaded(quotes));
     }
    );
  }
}
