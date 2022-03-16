import 'package:flutter/material.dart';

import '../utils/constant.dart';

class BottomLine extends StatelessWidget {
  const BottomLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 5,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: kBlueColor),
    );
  }
}
