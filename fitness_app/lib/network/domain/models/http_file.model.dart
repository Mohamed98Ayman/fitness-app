import 'dart:io';

class HttpFile {
  final String field;
  final File file;

  const HttpFile({
    required this.field,
    required this.file,
  });

  @override
  int get hashCode => Object.hash(
        field,
        file.path,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) return false;
    return other is HttpFile && hashCode == other.hashCode;
  }
}
