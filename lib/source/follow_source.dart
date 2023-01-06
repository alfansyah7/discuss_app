import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:http/http.dart';

import '../config/api.dart';
import '../model/user.dart';

class FollowSource {
  static Future<bool> checkIsFollowing(
      String fromIdUser, String toIdUser) async {
    String url = '${Api.follow}/check.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('FollowSource - checkIsFollowing', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['succes'];
    } catch (e) {
      DMethod.printTitle('FollowSource - checkIsFollowing', e.toString());
      return false;
    }
  }

  static Future<bool> following(String fromIdUser, String toIdUser) async {
    String url = '${Api.follow}/following.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('FollowSource - following', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['succes'];
    } catch (e) {
      DMethod.printTitle('FollowSource - following', e.toString());
      return false;
    }
  }

  static Future<bool> noFollowing(String fromIdUser, String toIdUser) async {
    String url = '${Api.follow}/no_following.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'from_id_user': fromIdUser,
        'to_id_user': toIdUser,
      });
      DMethod.printTitle('FollowSource - noFollowing', response.body);
      Map responseBody = jsonDecode(response.body);
      return responseBody['succes'];
    } catch (e) {
      DMethod.printTitle('FollowSource - noFollowing', e.toString());
      return false;
    }
  }

  static Future<List<User>> readFollower(String idUser) async {
    String url = '${Api.follow}/read_follower.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id_user': idUser,
      });
      DMethod.printTitle('FollowSource - readFollower', response.body);
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
      DMethod.printTitle('FollowSource - readFollower', e.toString());
      return [];
    }
  }

  static Future<List<User>> readFollowing(String idUser) async {
    String url = '${Api.follow}/read_following.php';
    try {
      Response response = await Client().post(Uri.parse(url), body: {
        'id_user': idUser,
      });
      DMethod.printTitle('FollowSource - readFollowing', response.body);
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
      DMethod.printTitle('FollowSource - readFollowing', e.toString());
      return [];
    }
  }
}
