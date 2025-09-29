// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TendencyPageState {
  List<TendencyContentsModel> get datas => throw _privateConstructorUsedError;

  /// Create a copy of TendencyPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TendencyPageStateCopyWith<TendencyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TendencyPageStateCopyWith<$Res> {
  factory $TendencyPageStateCopyWith(
    TendencyPageState value,
    $Res Function(TendencyPageState) then,
  ) = _$TendencyPageStateCopyWithImpl<$Res, TendencyPageState>;
  @useResult
  $Res call({List<TendencyContentsModel> datas});
}

/// @nodoc
class _$TendencyPageStateCopyWithImpl<$Res, $Val extends TendencyPageState>
    implements $TendencyPageStateCopyWith<$Res> {
  _$TendencyPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TendencyPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? datas = null}) {
    return _then(
      _value.copyWith(
            datas:
                null == datas
                    ? _value.datas
                    : datas // ignore: cast_nullable_to_non_nullable
                        as List<TendencyContentsModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TendencyPageStateImplCopyWith<$Res>
    implements $TendencyPageStateCopyWith<$Res> {
  factory _$$TendencyPageStateImplCopyWith(
    _$TendencyPageStateImpl value,
    $Res Function(_$TendencyPageStateImpl) then,
  ) = __$$TendencyPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TendencyContentsModel> datas});
}

/// @nodoc
class __$$TendencyPageStateImplCopyWithImpl<$Res>
    extends _$TendencyPageStateCopyWithImpl<$Res, _$TendencyPageStateImpl>
    implements _$$TendencyPageStateImplCopyWith<$Res> {
  __$$TendencyPageStateImplCopyWithImpl(
    _$TendencyPageStateImpl _value,
    $Res Function(_$TendencyPageStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TendencyPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? datas = null}) {
    return _then(
      _$TendencyPageStateImpl(
        datas:
            null == datas
                ? _value._datas
                : datas // ignore: cast_nullable_to_non_nullable
                    as List<TendencyContentsModel>,
      ),
    );
  }
}

/// @nodoc

class _$TendencyPageStateImpl implements _TendencyPageState {
  const _$TendencyPageStateImpl({
    final List<TendencyContentsModel> datas = const [],
  }) : _datas = datas;

  final List<TendencyContentsModel> _datas;
  @override
  @JsonKey()
  List<TendencyContentsModel> get datas {
    if (_datas is EqualUnmodifiableListView) return _datas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_datas);
  }

  @override
  String toString() {
    return 'TendencyPageState(datas: $datas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TendencyPageStateImpl &&
            const DeepCollectionEquality().equals(other._datas, _datas));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_datas));

  /// Create a copy of TendencyPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TendencyPageStateImplCopyWith<_$TendencyPageStateImpl> get copyWith =>
      __$$TendencyPageStateImplCopyWithImpl<_$TendencyPageStateImpl>(
        this,
        _$identity,
      );
}

abstract class _TendencyPageState implements TendencyPageState {
  const factory _TendencyPageState({final List<TendencyContentsModel> datas}) =
      _$TendencyPageStateImpl;

  @override
  List<TendencyContentsModel> get datas;

  /// Create a copy of TendencyPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TendencyPageStateImplCopyWith<_$TendencyPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TendencyContentsModel {
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  /// Create a copy of TendencyContentsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TendencyContentsModelCopyWith<TendencyContentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TendencyContentsModelCopyWith<$Res> {
  factory $TendencyContentsModelCopyWith(
    TendencyContentsModel value,
    $Res Function(TendencyContentsModel) then,
  ) = _$TendencyContentsModelCopyWithImpl<$Res, TendencyContentsModel>;
  @useResult
  $Res call({String type, String description, int score});
}

/// @nodoc
class _$TendencyContentsModelCopyWithImpl<
  $Res,
  $Val extends TendencyContentsModel
>
    implements $TendencyContentsModelCopyWith<$Res> {
  _$TendencyContentsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TendencyContentsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = null,
    Object? score = null,
  }) {
    return _then(
      _value.copyWith(
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            score:
                null == score
                    ? _value.score
                    : score // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TendencyContentsModelImplCopyWith<$Res>
    implements $TendencyContentsModelCopyWith<$Res> {
  factory _$$TendencyContentsModelImplCopyWith(
    _$TendencyContentsModelImpl value,
    $Res Function(_$TendencyContentsModelImpl) then,
  ) = __$$TendencyContentsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String description, int score});
}

/// @nodoc
class __$$TendencyContentsModelImplCopyWithImpl<$Res>
    extends
        _$TendencyContentsModelCopyWithImpl<$Res, _$TendencyContentsModelImpl>
    implements _$$TendencyContentsModelImplCopyWith<$Res> {
  __$$TendencyContentsModelImplCopyWithImpl(
    _$TendencyContentsModelImpl _value,
    $Res Function(_$TendencyContentsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TendencyContentsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = null,
    Object? score = null,
  }) {
    return _then(
      _$TendencyContentsModelImpl(
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        score:
            null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$TendencyContentsModelImpl implements _TendencyContentsModel {
  const _$TendencyContentsModelImpl({
    required this.type,
    required this.description,
    required this.score,
  });

  @override
  final String type;
  @override
  final String description;
  @override
  final int score;

  @override
  String toString() {
    return 'TendencyContentsModel(type: $type, description: $description, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TendencyContentsModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, description, score);

  /// Create a copy of TendencyContentsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TendencyContentsModelImplCopyWith<_$TendencyContentsModelImpl>
  get copyWith =>
      __$$TendencyContentsModelImplCopyWithImpl<_$TendencyContentsModelImpl>(
        this,
        _$identity,
      );
}

abstract class _TendencyContentsModel implements TendencyContentsModel {
  const factory _TendencyContentsModel({
    required final String type,
    required final String description,
    required final int score,
  }) = _$TendencyContentsModelImpl;

  @override
  String get type;
  @override
  String get description;
  @override
  int get score;

  /// Create a copy of TendencyContentsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TendencyContentsModelImplCopyWith<_$TendencyContentsModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
