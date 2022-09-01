 class characters {
  late int char_id;
  late String name;
  late String nickname;
  late String image;
  late String deadoralive;
  late String actorname;
  late List <dynamic> jobs;
  late List <dynamic> appearanceofseasons;
  late List <dynamic> categoryofseries;
  late List <dynamic> bettercallsaulappearance;
  
  characters.fromJson(Map < String , dynamic> json){
    char_id = json['char_id'];
    name = json['name'];
    nickname = json['nickname'];
    image = json['img'];
    deadoralive = json['status'];
    actorname = json['portrayed'];
    jobs = json['occupation'];
    appearanceofseasons = json['appearance'];
    categoryofseries = json['category'];
    bettercallsaulappearance = json['better_call_saul_appearance'];
  }
}