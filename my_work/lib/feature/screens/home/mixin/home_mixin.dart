import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_work/feature/screens/home/home_screen.dart';

import 'package:my_work/model/user_detail.dart';

mixin HomeMixin on State<HomeScreen> {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.github.com/', headers: {
    'Accept': 'application/vnd.github+json',
    'Authorization':
        'Bearer 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',
    'X-GitHub-Api-Version': '2022-11-28',
  }));

  @override
  void initState() {
    super.initState();

    getUsers();
  }

  Future<List<UserDetail>> getUsers() async {
    try {
      final response = await dio.get(
        '/users',
        options: Options(headers: {
          'Accept': 'application/vnd.github+json',
          'Authorization':
              'Bearer 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',
          'X-GitHub-Api-Version': '2022-11-28',
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = response.data as List<dynamic>;
        final users =
            jsonData.map((userJson) => UserDetail.fromJson(userJson)).toList();
        return users;
      } else {
        throw Exception('GitHub API request failed');
      }
    } catch (e) {
      print('Error: $e');
      SnackBar(content: Text("Error : $e"));
      throw Exception('An error occurred');
    }
  }

  void changeLanguage() {
    context.locale == const Locale('ru')
        ? context.setLocale(const Locale('en'))
        : context.setLocale(const Locale('ru'));
  }
}
