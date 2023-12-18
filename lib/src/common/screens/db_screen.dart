import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hop_pos/app/app_db.dart';

class DbScreen extends ConsumerWidget {
  const DbScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DriftDbViewer(ref.read(appDbProvider));
  }
}
