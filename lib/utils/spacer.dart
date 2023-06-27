import 'package:flutter/material.dart';
import 'package:pharmakilivre/utils/size_config.dart';

class EspaceContainer extends StatelessWidget {
  final double dimension;
  final String orientation;
  EspaceContainer({
    required this.dimension,
    required this.orientation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (orientation == "V") {
      return SizedBox(width: SizeConfig.blockH! * dimension);
    } else {
      return SizedBox(height: SizeConfig.blockH! * dimension);
    }
  }
}
