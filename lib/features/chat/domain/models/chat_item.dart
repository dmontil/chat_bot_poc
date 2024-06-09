import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_item.freezed.dart';
part 'chat_item.g.dart';

@freezed
class ChatItem with _$ChatItem {
  const factory ChatItem({
    required int position,
    required String title,
    required String description,
    required String link,
  }) = _ChatItem;

  factory ChatItem.fromJson(Map<String, dynamic> json) =>
      _$ChatItemFromJson(json);
}
