import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reglog/data/models/current_user_data.dart';
import 'package:reglog/data/repositories/db_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefProvider=Provider<SharedPreferences> ((ref){
  throw UnimplementedError();
});

final repositoryProvider=
    NotifierProvider<DbRepository,CurrentUserData>((){
      throw UnimplementedError();
    });