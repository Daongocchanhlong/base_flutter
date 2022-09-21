class EnumToString {
  static String convertToString(dynamic enumItem) {
    final String tmp = enumItem.toString().split('.')[1];
    return tmp;
  }
}
