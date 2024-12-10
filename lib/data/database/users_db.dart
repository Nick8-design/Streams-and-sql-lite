import 'package:drift/drift.dart';
import 'package:reglog/data/models/user_models.dart';
import 'connection.dart' as impl;

part 'users_db.g.dart';

class DbUser extends Table{
  IntColumn get id =>integer().autoIncrement()();
  TextColumn get linkimage =>text()();
  TextColumn get name =>text()();
  TextColumn get email =>text()();
  TextColumn get gender =>text()();
  IntColumn get contact =>integer()();
  TextColumn get password =>text()();
  DateTimeColumn get dob => dateTime()();

}

@DriftDatabase(
  tables:[DbUser],
  daos:[UsersDao],
)
class UsersDatabase extends _$UsersDatabase{
  UsersDatabase() : super(impl.connect());

  @override
 int get schemaVersion => 1;
}

@DriftAccessor(tables: [DbUser])
class UsersDao extends DatabaseAccessor<UsersDatabase> with
_$UsersDaoMixin{
  final UsersDatabase db;
  UsersDao(this.db):super(db);

  Future<List<DbUserData>> findAllUsers()=>
      select(dbUser).get();

  Stream<List<UserModels>> watchAllUsers(){
    return select(dbUser)
        .watch()
        .map((rows){
          final users=<UserModels>[];
          for(final row in rows){
            final user=dbUserToModelUser(row);
            if(!users.contains(user)){
              users.add(user);
            }
          }
          return users;
    }
    );

  }

  Future<List<DbUserData>> findAllFemaleAbove18() {
  final currentDate = DateTime.now();

  return (select(dbUser)..where((user) =>
  user.gender.equals("Female") &
  user.dob.isSmallerOrEqualValue(
  DateTime(currentDate.year - 18, currentDate.month, currentDate.day),
  ))).get();

}

  Stream<List<UserModels>> watchAllFemaleAbove18(){
    final currentDate = DateTime.now();
    return (select(dbUser)..where((user) =>
    user.gender.equals("Female") &
    user.dob.isSmallerOrEqualValue(
      DateTime(currentDate.year - 18, currentDate.month, currentDate.day),
    )))
        .watch()
        .map((rows){
       final fa18s=<UserModels>[];
       for(final row in rows){
         final fa18 =dbUserToModelUser(row);
         if(!fa18s.contains(fa18)){
           fa18s.add(fa18);
         }
                }
       return fa18s;

    });

  }


  Future<List<DbUserData>> findAllFemaleBelow18() {
    final currentDate = DateTime.now();

    return (select(dbUser)..where((user) =>
    user.gender.equals("Female") &
    user.dob.isBiggerThanValue(
      DateTime(currentDate.year - 18,
          currentDate.month, currentDate.day),
    ))).get();




  }
  Stream<List<UserModels>> watchAllFemaleBelow18(){
    final currentDate = DateTime.now();
    return (select(dbUser)..where((user) =>
    user.gender.equals("Female") &
    user.dob.isBiggerThanValue(
      DateTime(currentDate.year - 18,
          currentDate.month, currentDate.day),
    )))
        .watch()
        .map((rows){
      final fa18s=<UserModels>[];
      for(final row in rows){
        final fa18 =dbUserToModelUser(row);
        if(!fa18s.contains(fa18)){
          fa18s.add(fa18);
        }
      }
      return fa18s;

    });
  }

  Future<List<DbUserData>> findAllMaleAbove18() {
    final currentDate = DateTime.now();

    return (select(dbUser)..where((user) =>
    user.gender.equals("Male") &
    user.dob.isSmallerOrEqualValue(
      DateTime(currentDate.year - 18, currentDate.month, currentDate.day),
    ))).get();


  }

  Stream<List<UserModels>> watchAllmaleAbove18(){
    final currentDate = DateTime.now();
    return (select(dbUser)..where((user) =>
    user.gender.equals("Male") &
    user.dob.isSmallerOrEqualValue(
      DateTime(currentDate.year - 18, currentDate.month, currentDate.day),
    )))
        .watch()
        .map((rows){
      final fa18s=<UserModels>[];
      for(final row in rows){
        final fa18 =dbUserToModelUser(row);
        if(!fa18s.contains(fa18)){
          fa18s.add(fa18);
        }
      }
      return fa18s;

    });
  }

  Future<List<DbUserData>> findAllMaleBelow18() {
    final currentDate = DateTime.now();

    return (select(dbUser)..where((user) =>
    user.gender.equals("Male") &
    user.dob.isBiggerThanValue(
      DateTime(currentDate.year - 18,
          currentDate.month, currentDate.day),
    ))).get();

  }
  Stream<List<UserModels>> watchAllmalebelow18(){
    final currentDate = DateTime.now();
    return (select(dbUser)..where((user) =>
    user.gender.equals("Male") &
    user.dob.isBiggerThanValue(
      DateTime(currentDate.year - 18,
          currentDate.month, currentDate.day),
    )))
        .watch()
        .map((rows){
      final fa18s=<UserModels>[];
      for(final row in rows){
        final fa18 =dbUserToModelUser(row);
        if(!fa18s.contains(fa18)){
          fa18s.add(fa18);
        }
      }
      return fa18s;

    });
  }


  Future<List<DbUserData>> findAllOtherAbove18() {
    final currentDate = DateTime.now();



    return (select(dbUser)..where((user) =>
    user.gender.equals("Other") &
    user.dob.isSmallerOrEqualValue(
      DateTime(currentDate.year - 18, currentDate.month, currentDate.day),
    ))).get();


  }
  Stream<List<UserModels>> watchAllOtherAbove18(){
    final currentDate = DateTime.now();
    return (select(dbUser)..where((user) =>
    user.gender.equals("Other") &
    user.dob.isSmallerOrEqualValue(
      DateTime(currentDate.year - 18, currentDate.month, currentDate.day),
    )))
        .watch()
        .map((rows){
      final fa18s=<UserModels>[];
      for(final row in rows){
        final fa18 =dbUserToModelUser(row);
        if(!fa18s.contains(fa18)){
          fa18s.add(fa18);
        }
      }
      return fa18s;

    });
  }

  Future<List<DbUserData>> findAllOtherBelow18() {
    final currentDate = DateTime.now();

    return (select(dbUser)..where((user) =>
    user.gender.equals("Other") &
    user.dob.isBiggerThanValue(
      DateTime(currentDate.year - 18,
          currentDate.month, currentDate.day),
    ))).get();

  }
  Stream<List<UserModels>> watchAllOtherbelow18(){
    final currentDate = DateTime.now();
    return (select(dbUser)..where((user) =>
    user.gender.equals("Other") &
    user.dob.isBiggerThanValue(
      DateTime(currentDate.year - 18,
          currentDate.month, currentDate.day),
    )))
        .watch()
        .map((rows){
      final fa18s=<UserModels>[];
      for(final row in rows){
        final fa18 =dbUserToModelUser(row);
        if(!fa18s.contains(fa18)){
          fa18s.add(fa18);
        }
      }
      return fa18s;

    });
  }

  Future<List<DbUserData>> findUserById(int id) =>
      (select(dbUser)..where((user) =>
          user.id.equals(id))).get();



  // 7
  Future<int> insertUser(Insertable<DbUserData> user) =>
      into(dbUser).insert(user);

  Future<int> deleteUser(int id) => Future.value(
      (delete(dbUser)..where((user) =>
          user.id.equals(id))).go());
}

UserModels dbUserToModelUser(DbUserData user){
  return UserModels(
      id: user.id,
      linkimg: user.linkimage,
      name: user.name,
      email: user.email,
      gender: user.gender,
      contact: user.contact,
      password: user.password,
      dob: user.dob
  );
}
Insertable<DbUserData> userToInsertableDbUser(UserModels user){
  return DbUserCompanion.insert(
    id: Value.absentIfNull(user.id),
      linkimage: user.linkimg??"",
      name: user.name??'',
      email: user.email??'',
      gender: user.gender??'',
      contact: user.contact??0700742362,
      password: user.password??'',
      dob: user.dob??DateTime.now(),
  );
}



