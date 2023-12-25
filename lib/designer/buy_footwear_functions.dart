import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footwear_designer_247/designer/bottom_bar.dart';
import 'package:footwear_designer_247/designer/doc_wear.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> buyFootwearFuncGet() async {
  final preferences = await SharedPreferences.getInstance();
  return preferences.getBool('wqopkopvew') ?? false;
}

Future<void> buyFootwearFuncSet() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('wqopkopvew', true);
}

Future<void> buyFootwearFuncRestore(BuildContext context) async {
  final hasPremiumAccess = await Apphud.hasPremiumAccess();
  final hasActiveSubscription = await Apphud.hasActiveSubscription();
  if (hasPremiumAccess || hasActiveSubscription) {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("wqopkopvew", true);
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Success!'),
        content: const Text('Your purchase has been restored!'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const BottomBarWear()),
                (route) => false,
              );
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Restore purchase'),
        content: const Text(
            'Your purchase is not found. Write to support: ${DocWear.support}'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => {Navigator.of(context).pop()},
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
