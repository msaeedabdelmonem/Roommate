import 'dart:convert' as decoder;
extension StringExtensions on String {
  bool get containsUppercase => contains(RegExp(r'[A-Z]'));

  bool get containsLowercase => contains(RegExp(r'[a-z]'));
  ///to decode string base 64
  static String decodeBase64({required String value}){
    decoder.Codec<String, String> stringToBase64 = decoder.utf8.fuse(decoder.base64);   // dXNlcm5hbWU6cGFzc3dvcmQ=
    String decoded = stringToBase64.decode(value);
    return decoded;
  }
 static String convertDigitsToLatin(String s) {
  var sb =  StringBuffer();
  for (int i = 0; i < s.length; i++) {
    switch (s[i]) {
      //Arabic digits
      case '\u0660':
        sb.write('0');
        break;
      case '\u0661':
        sb.write('1');
        break;
      case '\u0662':
        sb.write('2');
        break;
      case '\u0663':
        sb.write('3');
        break;
      case '\u0664':
        sb.write('4');
        break;
      case '\u0665':
        sb.write('5');
        break;
      case '\u0666':
        sb.write('6');
        break;
      case '\u0667':
        sb.write('7');
        break;
      case '\u0668':
        sb.write('8');
        break;
      case '\u0669':
        sb.write('9');
        break;
      default:
        sb.write(s[i]);
        break;
    }
  }
  return sb.toString();
}
}