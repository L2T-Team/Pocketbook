import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key, required this.child});

  final Widget child;

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> with WidgetsBindingObserver {
  bool isUpdatedLatest = false;
  bool isShowPopup = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
