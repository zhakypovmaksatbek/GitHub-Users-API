import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_work/constants/color_constants.dart';
import 'package:my_work/constants/image_enum.dart';

import '../../core/navigator/navigate_routes.dart';
import '../../core/navigator/navigator_manager.dart';
import '../widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        NavigatorManager.instance
            .pushTopageReplacementNamed(NavigateRoutes.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWidget(imagePath: ImageEnum.github.imagePath),
            const SizedBox(height: 20),
            SpinKitDancingSquare(
              color: ColorConstants.black,
            )
          ],
        ),
      ),
    );
  }
}
