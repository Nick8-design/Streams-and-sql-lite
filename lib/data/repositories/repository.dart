import 'package:reglog/data/models/user_models.dart';

abstract class Repository {
  Future<List<UserModels>> findAllUsers();
  Stream<List<UserModels>> watchAllUsers();

  Future<List<UserModels>> findAllFemaleAbove18();
  Stream<List<UserModels>> watchAllFemaleAbove18();
  Future<List<UserModels>> findAllFemaleBelow18();
  Stream<List<UserModels>> watchAllFemaleBelow18();

  Future<List<UserModels>> findAllMaleAbove18();
  Stream<List<UserModels>> watchAllmaleAbove18();
  Future<List<UserModels>> findAllMaleBelow18();
  Stream<List<UserModels>> watchAllmalebelow18();

  Future<List<UserModels>> findAllOtherAbove18();
  Stream<List<UserModels>> watchAllOtherAbove18();
  Future<List<UserModels>> findAllOtherBelow18();
  Stream<List<UserModels>> watchAllOtherbelow18();

  Future<UserModels> findUserById(int id);
  Future<int> insertUser(UserModels user);

  Future<void> deleteUser(UserModels user);


  Future init();
  void close();

}