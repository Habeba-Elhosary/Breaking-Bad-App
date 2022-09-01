part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
class Charactersloaded extends CharactersState {
  late final List <dynamic> characters;
  Charactersloaded(this.characters);
}


