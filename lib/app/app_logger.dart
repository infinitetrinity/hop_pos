import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class AppLogger extends Logger {
  AppLogger({
    LogFilter? filter,
    LogPrinter? printer,
    LogOutput? output,
    Level? level,
  }) : super(
          filter: filter ?? defaultFilter(),
          printer: printer ?? defaultPrinter(),
          output: output ?? defaultOutput(),
          level: level,
        );

  static LogFilter? Function() defaultFilter = () {
    return kReleaseMode ? AppLoggerFilter() : null;
  };

  static LogPrinter Function() defaultPrinter = () {
    return kReleaseMode ? AppLoggerFilePrinter() : PrettyPrinter();
  };

  static LogOutput Function() defaultOutput = () {
    return kReleaseMode ? AppLoggerFileOutput() : ConsoleOutput();
  };
}

class AppLoggerFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

class AppLoggerFilePrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final dateTime = DateFormat('dd/MM/yyyy, hh:mm a').format(event.time);
    List<String> messages = [];
    final message = "$dateTime - (${event.level.toString()}): ${event.message}";
    messages.add(message);

    if (event.error != null) {
      messages.add("Error: ${event.error.toString()}");
    }

    if (event.stackTrace != null) {
      messages.add("Stacktrace: ${event.stackTrace.toString()}");
    }

    messages.add(
        "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
    return messages;
  }
}

class AppLoggerFileOutput extends LogOutput {
  Future<File> createLogFile() async {
    final folder = await getApplicationDocumentsDirectory();
    final file = File(p.join(folder.path, 'hop_pos-log.txt'));

    if (!(await file.exists())) {
      await file.create();
    }

    return file;
  }

  @override
  void output(OutputEvent event) async {
    try {
      final file = await createLogFile();

      for (var line in event.lines) {
        await file.writeAsString("$line ${Platform.lineTerminator}", mode: FileMode.append);
      }
    } catch (_) {}
  }
}
