import 'package:app_dart/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routerNeglect: true,
  urlPathStrategy: UrlPathStrategy.path,
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) => const MaterialPage(
        child: HomeScreen(),
      ),
    ),
  ],
);
