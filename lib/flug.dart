library flug;

import 'dart:async';

import 'package:flug/flug.container.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';


class Flug {

  static String _reportServer;
  static String _reportKey;

  static void init(String reportServer, String reportKey) {
    Flug._reportServer = reportServer;
    Flug._reportKey = reportKey;
  }

  static void runAppWithFlug(Function runApp) {
    runZoned<Future<void>>(() async {
      runApp();
    }, onError: (error, stackTrace) {
      // reportError(error, stackTrace.toString());
    });
  }

  static Widget materialAppBuilder(BuildContext context, Widget child) {
    return Navigator(onGenerateRoute: (settings) {
      return MaterialPageRoute(
        builder: (context) {
          return FlugContainer(
            bugReportServer: Flug._reportServer,
            bugReportKey: Flug._reportKey,
            child: child
          );
        }
      );
    });
  }
}