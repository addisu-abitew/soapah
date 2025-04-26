import 'package:flutter/material.dart';

class SafeScaffold extends StatelessWidget {
  final Widget? body;
  const SafeScaffold({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(padding: EdgeInsets.only(top: kToolbarHeight), child: body),
    );
  }
}
