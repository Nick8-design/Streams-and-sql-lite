import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reglog/data/models/user_models.dart';

part 'current_user_data.freezed.dart';

@freezed
class CurrentUserData with _$CurrentUserData{
  const factory CurrentUserData({
    @Default(<UserModels>[]) List<UserModels> currentUsers,
}) = _CurrentUserData;
}