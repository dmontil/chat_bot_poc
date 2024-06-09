// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) userMessage,
    required TResult Function(List<ChatItem> messages) botMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? userMessage,
    TResult? Function(List<ChatItem> messages)? botMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? userMessage,
    TResult Function(List<ChatItem> messages)? botMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserMessage value) userMessage,
    required TResult Function(BotMessage value) botMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserMessage value)? userMessage,
    TResult? Function(BotMessage value)? botMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserMessage value)? userMessage,
    TResult Function(BotMessage value)? botMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserMessageImplCopyWith<$Res> {
  factory _$$UserMessageImplCopyWith(
          _$UserMessageImpl value, $Res Function(_$UserMessageImpl) then) =
      __$$UserMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UserMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$UserMessageImpl>
    implements _$$UserMessageImplCopyWith<$Res> {
  __$$UserMessageImplCopyWithImpl(
      _$UserMessageImpl _value, $Res Function(_$UserMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UserMessageImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserMessageImpl implements UserMessage {
  _$UserMessageImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ChatMessage.userMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserMessageImplCopyWith<_$UserMessageImpl> get copyWith =>
      __$$UserMessageImplCopyWithImpl<_$UserMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) userMessage,
    required TResult Function(List<ChatItem> messages) botMessage,
  }) {
    return userMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? userMessage,
    TResult? Function(List<ChatItem> messages)? botMessage,
  }) {
    return userMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? userMessage,
    TResult Function(List<ChatItem> messages)? botMessage,
    required TResult orElse(),
  }) {
    if (userMessage != null) {
      return userMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserMessage value) userMessage,
    required TResult Function(BotMessage value) botMessage,
  }) {
    return userMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserMessage value)? userMessage,
    TResult? Function(BotMessage value)? botMessage,
  }) {
    return userMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserMessage value)? userMessage,
    TResult Function(BotMessage value)? botMessage,
    required TResult orElse(),
  }) {
    if (userMessage != null) {
      return userMessage(this);
    }
    return orElse();
  }
}

abstract class UserMessage implements ChatMessage {
  factory UserMessage({required final String message}) = _$UserMessageImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$UserMessageImplCopyWith<_$UserMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BotMessageImplCopyWith<$Res> {
  factory _$$BotMessageImplCopyWith(
          _$BotMessageImpl value, $Res Function(_$BotMessageImpl) then) =
      __$$BotMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ChatItem> messages});
}

/// @nodoc
class __$$BotMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$BotMessageImpl>
    implements _$$BotMessageImplCopyWith<$Res> {
  __$$BotMessageImplCopyWithImpl(
      _$BotMessageImpl _value, $Res Function(_$BotMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$BotMessageImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatItem>,
    ));
  }
}

/// @nodoc

class _$BotMessageImpl implements BotMessage {
  _$BotMessageImpl({required final List<ChatItem> messages})
      : _messages = messages;

  final List<ChatItem> _messages;
  @override
  List<ChatItem> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatMessage.botMessage(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BotMessageImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BotMessageImplCopyWith<_$BotMessageImpl> get copyWith =>
      __$$BotMessageImplCopyWithImpl<_$BotMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) userMessage,
    required TResult Function(List<ChatItem> messages) botMessage,
  }) {
    return botMessage(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? userMessage,
    TResult? Function(List<ChatItem> messages)? botMessage,
  }) {
    return botMessage?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? userMessage,
    TResult Function(List<ChatItem> messages)? botMessage,
    required TResult orElse(),
  }) {
    if (botMessage != null) {
      return botMessage(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserMessage value) userMessage,
    required TResult Function(BotMessage value) botMessage,
  }) {
    return botMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserMessage value)? userMessage,
    TResult? Function(BotMessage value)? botMessage,
  }) {
    return botMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserMessage value)? userMessage,
    TResult Function(BotMessage value)? botMessage,
    required TResult orElse(),
  }) {
    if (botMessage != null) {
      return botMessage(this);
    }
    return orElse();
  }
}

abstract class BotMessage implements ChatMessage {
  factory BotMessage({required final List<ChatItem> messages}) =
      _$BotMessageImpl;

  List<ChatItem> get messages;
  @JsonKey(ignore: true)
  _$$BotMessageImplCopyWith<_$BotMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
