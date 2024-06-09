// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatItem _$ChatItemFromJson(Map<String, dynamic> json) {
  return _ChatItem.fromJson(json);
}

/// @nodoc
mixin _$ChatItem {
  int get position => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatItemCopyWith<ChatItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatItemCopyWith<$Res> {
  factory $ChatItemCopyWith(ChatItem value, $Res Function(ChatItem) then) =
      _$ChatItemCopyWithImpl<$Res, ChatItem>;
  @useResult
  $Res call({int position, String title, String description, String link});
}

/// @nodoc
class _$ChatItemCopyWithImpl<$Res, $Val extends ChatItem>
    implements $ChatItemCopyWith<$Res> {
  _$ChatItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? title = null,
    Object? description = null,
    Object? link = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatItemImplCopyWith<$Res>
    implements $ChatItemCopyWith<$Res> {
  factory _$$ChatItemImplCopyWith(
          _$ChatItemImpl value, $Res Function(_$ChatItemImpl) then) =
      __$$ChatItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int position, String title, String description, String link});
}

/// @nodoc
class __$$ChatItemImplCopyWithImpl<$Res>
    extends _$ChatItemCopyWithImpl<$Res, _$ChatItemImpl>
    implements _$$ChatItemImplCopyWith<$Res> {
  __$$ChatItemImplCopyWithImpl(
      _$ChatItemImpl _value, $Res Function(_$ChatItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? title = null,
    Object? description = null,
    Object? link = null,
  }) {
    return _then(_$ChatItemImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatItemImpl implements _ChatItem {
  const _$ChatItemImpl(
      {required this.position,
      required this.title,
      required this.description,
      required this.link});

  factory _$ChatItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatItemImplFromJson(json);

  @override
  final int position;
  @override
  final String title;
  @override
  final String description;
  @override
  final String link;

  @override
  String toString() {
    return 'ChatItem(position: $position, title: $title, description: $description, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatItemImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, position, title, description, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatItemImplCopyWith<_$ChatItemImpl> get copyWith =>
      __$$ChatItemImplCopyWithImpl<_$ChatItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatItemImplToJson(
      this,
    );
  }
}

abstract class _ChatItem implements ChatItem {
  const factory _ChatItem(
      {required final int position,
      required final String title,
      required final String description,
      required final String link}) = _$ChatItemImpl;

  factory _ChatItem.fromJson(Map<String, dynamic> json) =
      _$ChatItemImpl.fromJson;

  @override
  int get position;
  @override
  String get title;
  @override
  String get description;
  @override
  String get link;
  @override
  @JsonKey(ignore: true)
  _$$ChatItemImplCopyWith<_$ChatItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
