// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) {
  return $_DeviceInfo.fromJson(json);
}

/// @nodoc
mixin _$DeviceInfo {
  String get model => throw _privateConstructorUsedError;
  String get osVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceInfoCopyWith<DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoCopyWith<$Res> {
  factory $DeviceInfoCopyWith(
          DeviceInfo value, $Res Function(DeviceInfo) then) =
      _$DeviceInfoCopyWithImpl<$Res, DeviceInfo>;
  @useResult
  $Res call({String model, String osVersion});
}

/// @nodoc
class _$DeviceInfoCopyWithImpl<$Res, $Val extends DeviceInfo>
    implements $DeviceInfoCopyWith<$Res> {
  _$DeviceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? osVersion = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$$_DeviceInfoImplCopyWith<$Res>
    implements $DeviceInfoCopyWith<$Res> {
  factory _$$$_DeviceInfoImplCopyWith(
          _$$_DeviceInfoImpl value, $Res Function(_$$_DeviceInfoImpl) then) =
      __$$$_DeviceInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String model, String osVersion});
}

/// @nodoc
class __$$$_DeviceInfoImplCopyWithImpl<$Res>
    extends _$DeviceInfoCopyWithImpl<$Res, _$$_DeviceInfoImpl>
    implements _$$$_DeviceInfoImplCopyWith<$Res> {
  __$$$_DeviceInfoImplCopyWithImpl(
      _$$_DeviceInfoImpl _value, $Res Function(_$$_DeviceInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? osVersion = null,
  }) {
    return _then(_$$_DeviceInfoImpl(
      null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      null == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$$_DeviceInfoImpl implements $_DeviceInfo {
  const _$$_DeviceInfoImpl(this.model, this.osVersion);

  factory _$$_DeviceInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$$_DeviceInfoImplFromJson(json);

  @override
  final String model;
  @override
  final String osVersion;

  @override
  String toString() {
    return 'DeviceInfo(model: $model, osVersion: $osVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$$_DeviceInfoImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, model, osVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$$_DeviceInfoImplCopyWith<_$$_DeviceInfoImpl> get copyWith =>
      __$$$_DeviceInfoImplCopyWithImpl<_$$_DeviceInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$$_DeviceInfoImplToJson(
      this,
    );
  }
}

abstract class $_DeviceInfo implements DeviceInfo {
  const factory $_DeviceInfo(final String model, final String osVersion) =
      _$$_DeviceInfoImpl;

  factory $_DeviceInfo.fromJson(Map<String, dynamic> json) =
      _$$_DeviceInfoImpl.fromJson;

  @override
  String get model;
  @override
  String get osVersion;
  @override
  @JsonKey(ignore: true)
  _$$$_DeviceInfoImplCopyWith<_$$_DeviceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
