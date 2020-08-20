/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:job_portal/src/pages/JobPortalPage/index.dart';

class AppRoutes {
  static Router router = Router();
  static String root = "/";
  static String jobPortal = "/job_portal";

  static void configureRoutes() {
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return Center(child: Text("ROUTE WAS NOT FOUND !!!", style: TextStyle(fontSize: 30)));
    });
    // router.define(root, handler: memberQuestionsHandler);
    router.define(root, handler: jobPortalHandler);
    router.define(jobPortal, handler: jobPortalHandler);
  }
}

var jobPortalHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return JobPortalPage();
});
