import 'package:breakingbad/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/characters_cubit.dart';
import '../widgets/character_item.dart';
class characters extends StatefulWidget {
  const characters({Key? key}) : super(key: key);
  @override
  State<characters> createState() => _charactersState();
}
class _charactersState extends State<characters> {
  late List<dynamic> allcharacters ;
  late List<dynamic> searchforcharacter ;
  bool issearching = false ;
  final searchtextcontroller = TextEditingController();

  Widget buildsearchfield (){
    return TextField(
      controller: searchtextcontroller,
      cursorColor:Mycolors.mygrey,
      decoration: InputDecoration(
        hintText:'Find a character .... ',
        border:InputBorder.none,
        hintStyle: TextStyle(color:Mycolors.mygrey , fontSize: 18 ,)
      ),
      style: TextStyle(color:Mycolors.mygrey , fontSize: 18 ,),
      onChanged: (searchedcharacter){
        addsearcheditemforsearchedlist(searchedcharacter);
        setState(() {
        });
      },
    );
  }
List <Widget> ? appbaritem (){
    if (issearching){ 
      return [ IconButton(onPressed: (){}, icon:Icon(Icons.clear, color: Mycolors.mygrey,)) ];
    }else{
      return [ IconButton(onPressed: startsearch, icon:Icon(Icons.search, color: Mycolors.mygrey,)) ];
    }
}
void addsearcheditemforsearchedlist (String searchedcharacter){
  searchforcharacter = allcharacters.where((character) => character.name.tolowercase().startswith(searchedcharacter)).toList();
}

void startsearch (){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopsearch));
    // **********************here
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   BlocProvider.of<CharactersCubit>(context).Getallcharacters();
  }
  Widget buildBlocWidget(){
    return BlocBuilder <CharactersCubit,CharactersState>(builder:(context, state){
      if(state is Charactersloaded){
        allcharacters = (state).characters;
        return buildloadedwidgets() ;
      }else{
        return showloadingindicator();
      }
    }
   );
  }
  Widget showloadingindicator(){
    return Center(
      child:CircularProgressIndicator(
        color:Mycolors.myyellow,
      ),
    );
  }
  Widget buildloadedwidgets(){
    return SingleChildScrollView(
      child: Container(
        color:Mycolors.mygrey,
        child: Column(
          children: [
            buildcharacterslist()
          ],
        ),
      ),
    );
  }
  Widget buildcharacterslist() {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2/3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
    ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics() ,
      padding: EdgeInsets.zero,
      itemCount: allcharacters.length,
      itemBuilder: (ctx , index){
      return CharacterItem(character: allcharacters[index],);
    }
    );
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor:Mycolors.myyellow,
       title: Text('Characters',style: TextStyle(color: Mycolors.mygrey),),
      ),
      body:buildBlocWidget(),

    );
  }

}
