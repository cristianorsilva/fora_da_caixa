import 'package:flutter/material.dart';

class VisibilityLoadingFC extends StatelessWidget {
  final bool isVisible;

  const VisibilityLoadingFC({Key? key, required this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      key: key,
      visible: isVisible,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - AppBar().preferredSize.height,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: Colors.amberAccent,
          valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}
