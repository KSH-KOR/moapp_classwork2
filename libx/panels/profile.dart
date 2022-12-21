
import 'package:flutter/material.dart';

import '../buttons/fav_button.dart';
import '../model.dart';
import '../utils.dart';

class ProfilePanel extends StatelessWidget {
  const ProfilePanel({Key? key, required this.pageModel}) : super(key: key);

  final Model pageModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pageModel.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            addVerticalSpace(5),
            Text(
              pageModel.studentNumber,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
        const FavoriteButton(),
      ],
    );
  }
}
