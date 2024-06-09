import 'package:flutter/foundation.dart';

mixin WidgetKeyEnumMixin on Enum {
  Key key({String? id}) => Key(name + (id ?? ''));
}
