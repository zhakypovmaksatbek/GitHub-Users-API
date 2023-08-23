// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:my_work/model/user_detail.dart';
import 'package:my_work/generated/locale_keys.g.dart';
import 'package:my_work/theme/my_theme.dart';

import '../widgets/my_listtile.dart';

class UserDetailScreen extends StatelessWidget with CustomTextStyle {
  final UserDetail user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.user_detail.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  user.avatarUrl.toString(),
                ),
              ),
            ),
            MyListTile(
              description: LocaleKeys.login.tr(),
              title: user.login.toString(),
            ),
            MyListTile(
              description: LocaleKeys.id.tr(),
              title: user.id.toString(),
            ),
            MyListTile(
              description: LocaleKeys.html_url.tr(),
              title: user.htmlUrl.toString(),
            ),
            MyListTile(
              description: LocaleKeys.mission.tr(),
              title: user.siteAdmin == false
                  ? LocaleKeys.user.tr()
                  : LocaleKeys.admin.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
