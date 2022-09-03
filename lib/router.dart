import 'package:breakingbad/business_logic/characters_cubit.dart';
import 'package:breakingbad/data/repository/characters_rep.dart';
import 'package:breakingbad/data/web_services/characters_web.dart';
import 'package:breakingbad/presentation/screens/character_details.dart';
import 'package:breakingbad/presentation/screens/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/strings.dart';
import 'data/models/characters.dart';

class AppRouter {
  late CharactersRepository charactersRepository ;
  late CharactersCubit charactersCubit ;
  AppRouter(){
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository) ;
  }
  
  Route ? generateRoute  (RouteSettings settings){
    switch(settings.name) {
      case charactersScreen :
        return MaterialPageRoute(builder:(_) => BlocProvider(
            create: ( BuildContext context) => charactersCubit,
            child : const CharactersScreen()
        ),
      );
      case characterDetailsScreen :
       final character = settings.arguments as Data ;
        return MaterialPageRoute(builder:(_) => BlocProvider(
          create:(BuildContext context) => CharactersCubit(charactersRepository),
            child: CharacterDetailsScreen(character:character)));
    }
    return null;
  }
}
