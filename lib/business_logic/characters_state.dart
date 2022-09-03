part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
class CharactersLoaded extends CharactersState {
  late final List <dynamic> characters;
  CharactersLoaded(this.characters);
}
class QuotesLoaded extends CharactersState {
  final List <Quote> quotes;
  QuotesLoaded(this.quotes);
}


