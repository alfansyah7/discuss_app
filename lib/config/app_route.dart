import 'package:course_discuss_app/config/session.dart';
import 'package:course_discuss_app/controller/c_add_topic.dart';
import 'package:course_discuss_app/controller/c_comment.dart';
import 'package:course_discuss_app/controller/c_follower.dart';
import 'package:course_discuss_app/controller/c_following.dart';
import 'package:course_discuss_app/controller/c_profile.dart';
import 'package:course_discuss_app/controller/c_search.dart';
import 'package:course_discuss_app/page/error_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../model/user.dart';
import '../page/home_page.dart';
import '../page/login_page.dart';
import '../page/register_page.dart';

class AppRoute {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';
  static const addTopic = '/addTopic';
  static const profile = '/profile';
  static const search = '/search';
  static const follower = '/follower';
  static const following = '/following';
  static const comment = '/comment';

  static GoRouter routerConfig = GoRouter(
    errorBuilder: (context, state) => ErrorPage(
        tittle: 'Something Error', description: state.error.toString()),
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      User? user = await Session.getUser();
      if (user == null) {
        if (state.location == login || state.location == register) {
          return null;
        }

        return login;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => RegisterPage(),
      ),
      GoRoute(
        path: addTopic,
        builder: (context, state) => ChangeNotifierProvider(
            create: (_) => CAddTopic(), child: const Scaffold()),
      ),
      GoRoute(
        path: profile,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => CProfile(),
          child: const Scaffold(),
        ),
      ),
      GoRoute(
        path: search,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => CSearch(),
          child: const Scaffold(),
        ),
      ),
      GoRoute(
        path: follower,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => CFollower(),
          child: const Scaffold(),
        ),
      ),
      GoRoute(
        path: following,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => CFollowing(),
          child: const Scaffold(),
        ),
      ),
      GoRoute(
        path: comment,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => CComment(),
          child: const Scaffold(),
        ),
      ),
    ],
  );
}
