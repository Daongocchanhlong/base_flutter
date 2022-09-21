import 'package:xml/xml.dart';

extension MapEx on Map<String, dynamic> {
  String toStringXML({String? nameMethod, String keyInput = 't4f'}) {
    final XmlBuilder xml = XmlBuilder();
    if (nameMethod != null) {
      xml.element('$keyInput:$nameMethod', nest: () {
        forEach((String key, dynamic value) {
          xml.element('$keyInput:$key', nest: _converXML(value));
        });
      });
    } else {
      forEach((String key, dynamic value) {
        xml.element('$keyInput:$key', nest: _converXML(value));
      });
    }

    return xml.buildDocument().toString();
  }

  String _converXML(dynamic input) {
    if (input is List) {
      final XmlBuilder xml = XmlBuilder();
      if (input is List<int>) {
        for (final int value in input) {
          xml.element('t4f:int', nest: value);
        }
      } else if (input is List<double>) {
        for (final double value in input) {
          xml.element('t4f:double', nest: value);
        }
      } else {
        for (final String value in input) {
          xml.element('t4f:string', nest: value);
        }
      }
      return xml.buildDocument().toString();
    }
    return '$input';
  }

  dynamic getData(String key) {
    return this[key]?['\$t'];
  }
}
