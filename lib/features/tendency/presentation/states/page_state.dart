import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_state.freezed.dart';

@freezed
class TendencyPageState with _$TendencyPageState {
  const factory TendencyPageState({
    @Default([]) List<TendencyContentsModel> datas,
  }) = _TendencyPageState;
}

@freezed
class TendencyContentsModel with _$TendencyContentsModel {
  const factory TendencyContentsModel({
    required String type,
    required String description,
    required int score,
  }) = _TendencyContentsModel;
}
