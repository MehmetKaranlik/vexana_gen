extension StrExt on String {
  String get removeQuestionMark => replaceAll('?', '');
  String get removeStar => replaceAll('*', '');
}
