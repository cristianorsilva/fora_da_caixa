import 'package:flutter/material.dart';

class VisibilityShadowFC extends StatelessWidget {
  final bool isVisible;
  final double? height;

  const VisibilityShadowFC({Key? key, required this.isVisible, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      key: key,
      visible: isVisible,
      child: Opacity(
        opacity: 0.4,
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: height ?? MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - AppBar().preferredSize.height,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
