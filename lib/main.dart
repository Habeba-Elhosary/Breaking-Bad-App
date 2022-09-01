import 'package:breakingbad/router.dart';
import 'package:flutter/material.dart';
void main (){
  runApp(breakingbad(appRouter: AppRouter(),));
}
class breakingbad extends StatelessWidget {
  final AppRouter appRouter;
  const breakingbad({Key? key , required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     onGenerateRoute:appRouter.generateRoute,
    );
  }
}
