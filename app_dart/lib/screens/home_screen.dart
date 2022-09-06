import 'package:app_dart/di/providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context, ref) {
    final now = ref.watch(curentTimeProvider);
    final zone = ref.watch(zoneProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Time in ${zone.name}',
              style: GoogleFonts.comicNeue(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              now.when(
                  data: (data) => DateFormat('HH:mm:ss').format(data),
                  loading: () => 'Gathering Data',
                  error: (error, stackTrace) => 'Something Whent Wrong'),
              style: GoogleFonts.comicNeue(fontSize: 100),
            ),
          ],
        ),
      ),
    );
  }
}
