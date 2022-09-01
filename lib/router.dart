import 'package:breakingbad/business_logic/characters_cubit.dart';
import 'package:breakingbad/data/repository/characters_rep.dart';
import 'package:breakingbad/data/web_services/characters_web.dart';
import 'package:breakingbad/presentation/screens/character_details.dart';
import 'package:breakingbad/presentation/screens/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/strings.dart';
class AppRouter {
  late Charactersrepository charactersrepository ;
  late CharactersCubit charactersCubit ;
  AppRouter(){
    charactersrepository = Charactersrepository(Characterswebservices());
    charactersCubit = CharactersCubit(charactersrepository) ;
  }
  
  Route ? generateRoute  (RouteSettings settings){
    switch(settings.name) {
      case charactersscreen :
        return MaterialPageRoute(builder:(_) => BlocProvider(
            create: ( BuildContext context) => charactersCubit,
            child : characters()
        ),
      );
      case charactersscreen :
        return MaterialPageRoute(builder:(_) => characterDetails());
    }
  }
}