import 'dart:convert';
import 'package:course_discuss_app/config/api.dart';
import 'package:course_discuss_app/model/user.dart';
import 'package:d_method/d_method.dart';
import 'package:http/http.dart';

class UserSource {
  static Future<Map> register(String username, String password) async {
    String url = '${Api.user}/registers.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'username': username,
        'password': password,
      });
      DMethod.printTitle('User source - register', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      DMethod.printTitle('User source - register', e.toString());
      return {'succes': false};
    }
  }

  static Future<Map> login(String username, String password) async {
    String url = '${Api.user}/login.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'username': username,
        'password': password,
      });
      DMethod.printTitle(
          maxBodyChar: 300, 'User source - login', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      DMethod.printTitle(maxBodyChar: 500, 'User source - login', e.toString());
      return {'succes': false};
    }
  }

  static Future<bool> updateImage(
    String id,
    String oldImage,
    String newImage,
    newBase64code,
  ) async {
    String url = '${Api.user}/update_image.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id': id,
        'old_image': oldImage,
        'new_image': newImage,
        'new_base64code': newBase64code,
      });
      DMethod.printTitle('User source - updateImage', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['succes'];
    } catch (e) {
      DMethod.printTitle('User source - updateImage', e.toString());
      return false;
    }
  }

  static Future<Map<String, dynamic>> stat(String idUser) async {
    String url = '${Api.user}/stat.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id_user': idUser,
      });
      DMethod.printTitle('User source - stat', response.body);
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      DMethod.printTitle('User source - stat', e.toString());
      return {
        'topic': 0.0,
        'follower': 0.0,
        'following': 0.0,
      };
    }
  }

  static Future<List<User>> search(String query) async {
    String url = '${Api.user}/search.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'search_query': query,
      });
      DMethod.printTitle('User source - stat', response.body);
      Map responseBody = jsonDecode(response.body);
      if (responseBody['succes']) {
        List list = responseBody['data'];
        return list.map((e) {
          Map<String, dynamic> item = Map<String, dynamic>.from(e);
          return User.fromJson(item);
        }).toList();
      }
      return [];
    } catch (e) {
      DMethod.printTitle('User source - stat', e.toString());
      return [];
    }
  }
}
