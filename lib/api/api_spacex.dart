import 'package:spacex/model/space_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class SpaceXAPI {
  final Uri spaceAPIurl = Uri.parse("https://api.spacexdata.com/v5/launches");

  Future<List<Space>> getnwspace() async {
    Response response = await get(spaceAPIurl);
    
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      // ignore: non_constant_identifier_names
      List<Space> XspaceNews = body.map((dynamic item) => Space.fromJson(item)).toList();
      return XspaceNews;
    } else {
      throw ("Sin noticias");
    }
  }
}
