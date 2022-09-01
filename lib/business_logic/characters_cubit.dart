import 'package:bloc/bloc.dart';
import 'package:breakingbad/data/models/characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../data/repository/characters_rep.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final Charactersrepository charactersrepository;
   List <dynamic> mycharacters =[];
  CharactersCubit(this.charactersrepository) : super(CharactersInitial());
  List <dynamic> Getallcharacters() {
    charactersrepository.Getallcharacters().then((characters){
      emit(Charactersloaded(characters));
      mycharacters = characters ;
    }
    );
    return mycharacters;
  }
}
