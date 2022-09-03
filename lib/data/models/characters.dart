
class Data {
  late int charId;
  late String name;
  late String nickName;
  late String image;
  late String deadOrAlive;
  late String actorName;
  late List <dynamic> jobs;
  late List <dynamic> appearanceOfSeasons;
  late String categoryOfSeries;
  late List <dynamic> betterCallSaulAppearance;

  Data.fromJson(Map < String , dynamic> json){
    charId = json['char_id'];
    name = json['name'];
    nickName = json['nickname'];
    image = json['img'];
    deadOrAlive = json['status'];
    actorName = json['portrayed'];
    jobs = json['occupation'];
    appearanceOfSeasons = json['appearance'];
    categoryOfSeries = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];
  }
}