import 'package:flutter/material.dart';
import '../../theme/my_theme.dart';

class MyListTile extends StatelessWidget with CustomTextStyle {
  const MyListTile({
    Key? key,
    required this.description,
    required this.title,
  }) : super(key: key);
  final String description;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: commentTextStyle,
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              title,
              style: middleTextStyle,
            )),
      ],
    );
  }
}
