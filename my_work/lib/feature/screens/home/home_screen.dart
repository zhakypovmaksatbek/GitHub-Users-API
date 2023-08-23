import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_work/constants/color_constants.dart';
import 'package:my_work/constants/image_enum.dart';
import 'package:my_work/core/navigator/index.dart';
import 'package:my_work/model/user_detail.dart';
import 'package:my_work/feature/widgets/logo_widget.dart';

import 'package:my_work/theme/my_theme.dart';

import 'mixin/home_mixin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with CustomTextStyle, HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LogoWidget(
          imagePath: ImageEnum.github.imagePath,
          color: ColorConstants.white,
          height: 40,
        ),
        actions: [
          TextButton(
              onPressed: changeLanguage,
              child: Text(
                context.locale == const Locale('ru') ? 'Ру' : 'En',
                style: normTextStyle,
              ))
        ],
      ),
      body: FutureBuilder<List<UserDetail>>(
        future: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitFadingCircle(
              color: ColorConstants.black,
            );
          } else if (snapshot.hasError) {
            return const SnackBar(
                content: Text("Data menen bailanysha albady"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No Data'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        NavigatorManager.instance
                            .pushToPage(NavigateRoutes.detail, arguments: user);
                      },
                      title: Text(user.login.toString(),
                          style: middleTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: const Color.fromARGB(255, 73, 73, 73))),
                      subtitle: Text(user.id.toString()),
                      leading: CircleAvatar(
                          backgroundColor: ColorConstants.white,
                          backgroundImage: AssetImage(
                            ImageEnum.github.imagePath,
                          ),
                          child: Image.network(user.avatarUrl.toString())),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

Widget unknownIOError() {
  return const Expanded(
    child: Center(
      child: Text(
        'No sure what went wrong. Mind trying again?',
      ),
    ),
  );
}

Widget networkErrorView(String message) {
  return Expanded(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.signal_cellular_connected_no_internet_4_bar,
            color: ColorConstants.azureWhite,
            size: 50.0,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: ColorConstants.black,
            ),
          )
        ],
      ),
    ),
  );
}
