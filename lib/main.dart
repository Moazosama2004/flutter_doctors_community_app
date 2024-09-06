import 'package:flutter/material.dart';
import 'package:flutter_doctors_community_app/core/di/dependancy_injection.dart';
import 'package:flutter_doctors_community_app/core/routing/app_router.dart';
import 'package:flutter_doctors_community_app/doc_app.dart';

void main() {
  setupGetIt();
  runApp(DocdocApp(
    appRouter: AppRouter(),
  ));
}
