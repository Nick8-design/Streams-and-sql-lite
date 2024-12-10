import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reglog/data/database/users_db.dart';
import 'package:reglog/data/models/current_user_data.dart';
import 'package:reglog/data/models/user_models.dart';
import 'package:reglog/data/repositories/repository.dart';

class DbRepository extends Notifier<CurrentUserData>
implements Repository{

  late UsersDatabase usersDatabase;
  late UsersDao _usersDao;

  Stream<List<UserModels>>? userstream;
 // Stream<List<UserModels>>? allUsersStream;
  Stream<List<UserModels>>? femaleAbove18Stream;
  Stream<List<UserModels>>? femaleBelow18Stream;
  Stream<List<UserModels>>? maleAbove18Stream;
  Stream<List<UserModels>>? maleBelow18Stream;
  Stream<List<UserModels>>? otherAbove18Stream;
  Stream<List<UserModels>>? otherBelow18Stream;


  @override
  CurrentUserData build() {
    const currentUserData = CurrentUserData();
    return currentUserData;
  }

  @override
  Future<List<UserModels>> findAllUsers(){
    return _usersDao.findAllUsers()
        .then<List<UserModels>>(
            (List<DbUserData> dbUsers) async {
              final users =<UserModels>[];

              for(final dbuser in dbUsers){
                users.add(dbUserToModelUser(dbuser));

              }
              return users;
            }
    );

  }

  @override
  Stream<List<UserModels>> watchAllUsers(){
    userstream??=_usersDao.watchAllUsers();
    return userstream!;
  }



  @override
  Future<void> deleteUser(UserModels user) {
   if(user.id!=null){
     final updatedList=[...state.currentUsers];
     updatedList.remove(user);
     state=state.copyWith(currentUsers: updatedList);

     _usersDao.deleteUser(user.id);
   }
   return Future.value();
  }

  @override
  Future<List<UserModels>> findAllFemaleAbove18() {
    return _usersDao.findAllFemaleAbove18()
        .then<List<UserModels>>(
            (List<DbUserData> dbUsers) async {
          final users =<UserModels>[];

          for(final dbuser in dbUsers){
            users.add(dbUserToModelUser(dbuser));

          }
          return users;
        }
    );
  }

  @override
  Future<List<UserModels>> findAllFemaleBelow18() {
    return _usersDao.findAllFemaleBelow18()
        .then<List<UserModels>>(
            (List<DbUserData> dbUsers) async {
          final users =<UserModels>[];

          for(final dbuser in dbUsers){
            users.add(dbUserToModelUser(dbuser));

          }
          return users;
        }
    );
  }

  @override
  Future<List<UserModels>> findAllMaleAbove18() {
    return _usersDao.findAllMaleAbove18()
        .then<List<UserModels>>(
            (List<DbUserData> dbUsers) async {
          final users =<UserModels>[];

          for(final dbuser in dbUsers){
            users.add(dbUserToModelUser(dbuser));

          }
          return users;
        }
    );
  }

  @override
  Future<List<UserModels>> findAllMaleBelow18() {
    return _usersDao.findAllMaleBelow18()
        .then<List<UserModels>>(
            (List<DbUserData> dbUsers) async {
          final users =<UserModels>[];

          for(final dbuser in dbUsers){
            users.add(dbUserToModelUser(dbuser));

          }
          return users;
        }
    );
  }

  @override
  Future<List<UserModels>> findAllOtherAbove18() {
    return _usersDao.findAllOtherAbove18()
        .then<List<UserModels>>(
            (List<DbUserData> dbUsers) async {
          final users =<UserModels>[];

          for(final dbuser in dbUsers){
            users.add(dbUserToModelUser(dbuser));

          }
          return users;
        }
    );
  }

  @override
  Future<List<UserModels>> findAllOtherBelow18() {
    return _usersDao.findAllOtherBelow18()
        .then<List<UserModels>>(
            (List<DbUserData> dbUsers) async {
          final users =<UserModels>[];

          for(final dbuser in dbUsers){
            users.add(dbUserToModelUser(dbuser));

          }
          return users;
        }
    );
  }

  @override
  Future<UserModels> findUserById(int id) async{
 return _usersDao.findUserById(id)
     .then((listofusers)=>
 dbUserToModelUser(listofusers.first)
 );
  }

  @override
  Future<int> insertUser(UserModels user) {
   if(state.currentUsers.contains(user)){
     return Future.value(0);
   }
   return Future(
       () async {
      state=state.copyWith(currentUsers: [...state.currentUsers,user]);
      final id=await _usersDao.insertUser(
        userToInsertableDbUser(user)
      );
      return id;

       }
   );
  }

  @override
  Stream<List<UserModels>> watchAllFemaleAbove18() {
    femaleAbove18Stream??=_usersDao.watchAllFemaleAbove18();
    return userstream!;
  }

  @override
  Stream<List<UserModels>> watchAllFemaleBelow18() {
    femaleBelow18Stream??=_usersDao.watchAllFemaleBelow18();
    return userstream!;
  }

  @override
  Stream<List<UserModels>> watchAllOtherAbove18() {
    otherAbove18Stream??=_usersDao.watchAllOtherAbove18();
    return userstream!;
  }

  @override
  Stream<List<UserModels>> watchAllOtherbelow18() {
    otherBelow18Stream??=_usersDao.watchAllOtherbelow18();
    return userstream!;
  }

  @override
  Stream<List<UserModels>> watchAllmaleAbove18() {
    maleAbove18Stream??=_usersDao.watchAllmaleAbove18();
    return userstream!;
  }

  @override
  Stream<List<UserModels>> watchAllmalebelow18() {
    maleBelow18Stream??=_usersDao.watchAllmalebelow18();
    return userstream!;
  }







  @override
  Future init() async{
    usersDatabase =UsersDatabase();
    _usersDao=usersDatabase.usersDao;

  }

  @override
  void close(){
    usersDatabase.close();
  }



}

