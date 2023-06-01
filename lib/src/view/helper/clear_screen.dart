import 'dart:io';

void clearScreen() {
  var clearCommand = Platform.isWindows ? "cls" : "clear";
  print(Process.runSync(clearCommand, [], runInShell: true).stdout);
}