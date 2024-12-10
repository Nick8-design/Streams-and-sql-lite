// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrentUserData {
  List<UserModels> get currentUsers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentUserDataCopyWith<CurrentUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentUserDataCopyWith<$Res> {
  factory $CurrentUserDataCopyWith(
          CurrentUserData value, $Res Function(CurrentUserData) then) =
      _$CurrentUserDataCopyWithImpl<$Res, CurrentUserData>;
  @useResult
  $Res call({List<UserModels> currentUsers});
}

/// @nodoc
class _$CurrentUserDataCopyWithImpl<$Res, $Val extends CurrentUserData>
    implements $CurrentUserDataCopyWith<$Res> {
  _$CurrentUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUsers = null,
  }) {
    return _then(_value.copyWith(
      currentUsers: null == currentUsers
          ? _value.currentUsers
          : currentUsers // ignore: cast_nullable_to_non_nullable
              as List<UserModels>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentUserDataImplCopyWith<$Res>
    implements $CurrentUserDataCopyWith<$Res> {
  factory _$$CurrentUserDataImplCopyWith(_$CurrentUserDataImpl value,
          $Res Function(_$CurrentUserDataImpl) then) =
      __$$CurrentUserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserModels> currentUsers});
}

/// @nodoc
class __$$CurrentUserDataImplCopyWithImpl<$Res>
    extends _$CurrentUserDataCopyWithImpl<$Res, _$CurrentUserDataImpl>
    implements _$$CurrentUserDataImplCopyWith<$Res> {
  __$$CurrentUserDataImplCopyWithImpl(
      _$CurrentUserDataImpl _value, $Res Function(_$CurrentUserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentUsers = null,
  }) {
    return _then(_$CurrentUserDataImpl(
      currentUsers: null == currentUsers
          ? _value._currentUsers
          : currentUsers // ignore: cast_nullable_to_non_nullable
              as List<UserModels>,
    ));
  }
}

/// @nodoc

class _$CurrentUserDataImpl implements _CurrentUserData {
  const _$CurrentUserDataImpl(
      {final List<UserModels> currentUsers = const <UserModels>[]})
      : _currentUsers = currentUsers;

  final List<UserModels> _currentUsers;
  @override
  @JsonKey()
  List<UserModels> get currentUsers {
    if (_currentUsers is EqualUnmodifiableListView) return _currentUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentUsers);
  }

  @override
  String toString() {
    return 'CurrentUserData(currentUsers: $currentUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentUserDataImpl &&
            const DeepCollectionEquality()
                .equals(other._currentUsers, _currentUsers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_currentUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentUserDataImplCopyWith<_$CurrentUserDataImpl> get copyWith =>
      __$$CurrentUserDataImplCopyWithImpl<_$CurrentUserDataImpl>(
          this, _$identity);
}

abstract class _CurrentUserData implements CurrentUserData {
  const factory _CurrentUserData({final List<UserModels> currentUsers}) =
      _$CurrentUserDataImpl;

  @override
  List<UserModels> get currentUsers;
  @override
  @JsonKey(ignore: true)
  _$$CurrentUserDataImplCopyWith<_$CurrentUserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
