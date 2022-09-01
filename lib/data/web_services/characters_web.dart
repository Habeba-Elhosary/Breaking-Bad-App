import 'package:breakingbad/constants/strings.dart';
import'package:dio/dio.dart';
class Characterswebservices {
  late Dio dio ;

  Characterswebservices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000,
    );

    dio = Dio(options);
  }
  Future<List<dynamic>> Getallcharacters() async{
    try{
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    } catch (e) {
        print(e.toString());
        return[];
    }
  }
}
