// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_db.dart';

// ignore_for_file: type=lint
class $DbUserTable extends DbUser with TableInfo<$DbUserTable, DbUserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbUserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _linkimageMeta =
      const VerificationMeta('linkimage');
  @override
  late final GeneratedColumn<String> linkimage = GeneratedColumn<String>(
      'linkimage', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactMeta =
      const VerificationMeta('contact');
  @override
  late final GeneratedColumn<int> contact = GeneratedColumn<int>(
      'contact', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<DateTime> dob = GeneratedColumn<DateTime>(
      'dob', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, linkimage, name, email, gender, contact, password, dob];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_user';
  @override
  VerificationContext validateIntegrity(Insertable<DbUserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('linkimage')) {
      context.handle(_linkimageMeta,
          linkimage.isAcceptableOrUnknown(data['linkimage']!, _linkimageMeta));
    } else if (isInserting) {
      context.missing(_linkimageMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    } else if (isInserting) {
      context.missing(_dobMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbUserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbUserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      linkimage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}linkimage'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      contact: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}contact'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      dob: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dob'])!,
    );
  }

  @override
  $DbUserTable createAlias(String alias) {
    return $DbUserTable(attachedDatabase, alias);
  }
}

class DbUserData extends DataClass implements Insertable<DbUserData> {
  final int id;
  final String linkimage;
  final String name;
  final String email;
  final String gender;
  final int contact;
  final String password;
  final DateTime dob;
  const DbUserData(
      {required this.id,
      required this.linkimage,
      required this.name,
      required this.email,
      required this.gender,
      required this.contact,
      required this.password,
      required this.dob});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['linkimage'] = Variable<String>(linkimage);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['gender'] = Variable<String>(gender);
    map['contact'] = Variable<int>(contact);
    map['password'] = Variable<String>(password);
    map['dob'] = Variable<DateTime>(dob);
    return map;
  }

  DbUserCompanion toCompanion(bool nullToAbsent) {
    return DbUserCompanion(
      id: Value(id),
      linkimage: Value(linkimage),
      name: Value(name),
      email: Value(email),
      gender: Value(gender),
      contact: Value(contact),
      password: Value(password),
      dob: Value(dob),
    );
  }

  factory DbUserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbUserData(
      id: serializer.fromJson<int>(json['id']),
      linkimage: serializer.fromJson<String>(json['linkimage']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      gender: serializer.fromJson<String>(json['gender']),
      contact: serializer.fromJson<int>(json['contact']),
      password: serializer.fromJson<String>(json['password']),
      dob: serializer.fromJson<DateTime>(json['dob']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'linkimage': serializer.toJson<String>(linkimage),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'gender': serializer.toJson<String>(gender),
      'contact': serializer.toJson<int>(contact),
      'password': serializer.toJson<String>(password),
      'dob': serializer.toJson<DateTime>(dob),
    };
  }

  DbUserData copyWith(
          {int? id,
          String? linkimage,
          String? name,
          String? email,
          String? gender,
          int? contact,
          String? password,
          DateTime? dob}) =>
      DbUserData(
        id: id ?? this.id,
        linkimage: linkimage ?? this.linkimage,
        name: name ?? this.name,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        contact: contact ?? this.contact,
        password: password ?? this.password,
        dob: dob ?? this.dob,
      );
  DbUserData copyWithCompanion(DbUserCompanion data) {
    return DbUserData(
      id: data.id.present ? data.id.value : this.id,
      linkimage: data.linkimage.present ? data.linkimage.value : this.linkimage,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      gender: data.gender.present ? data.gender.value : this.gender,
      contact: data.contact.present ? data.contact.value : this.contact,
      password: data.password.present ? data.password.value : this.password,
      dob: data.dob.present ? data.dob.value : this.dob,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DbUserData(')
          ..write('id: $id, ')
          ..write('linkimage: $linkimage, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('contact: $contact, ')
          ..write('password: $password, ')
          ..write('dob: $dob')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, linkimage, name, email, gender, contact, password, dob);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbUserData &&
          other.id == this.id &&
          other.linkimage == this.linkimage &&
          other.name == this.name &&
          other.email == this.email &&
          other.gender == this.gender &&
          other.contact == this.contact &&
          other.password == this.password &&
          other.dob == this.dob);
}

class DbUserCompanion extends UpdateCompanion<DbUserData> {
  final Value<int> id;
  final Value<String> linkimage;
  final Value<String> name;
  final Value<String> email;
  final Value<String> gender;
  final Value<int> contact;
  final Value<String> password;
  final Value<DateTime> dob;
  const DbUserCompanion({
    this.id = const Value.absent(),
    this.linkimage = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.gender = const Value.absent(),
    this.contact = const Value.absent(),
    this.password = const Value.absent(),
    this.dob = const Value.absent(),
  });
  DbUserCompanion.insert({
    this.id = const Value.absent(),
    required String linkimage,
    required String name,
    required String email,
    required String gender,
    required int contact,
    required String password,
    required DateTime dob,
  })  : linkimage = Value(linkimage),
        name = Value(name),
        email = Value(email),
        gender = Value(gender),
        contact = Value(contact),
        password = Value(password),
        dob = Value(dob);
  static Insertable<DbUserData> custom({
    Expression<int>? id,
    Expression<String>? linkimage,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? gender,
    Expression<int>? contact,
    Expression<String>? password,
    Expression<DateTime>? dob,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (linkimage != null) 'linkimage': linkimage,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (gender != null) 'gender': gender,
      if (contact != null) 'contact': contact,
      if (password != null) 'password': password,
      if (dob != null) 'dob': dob,
    });
  }

  DbUserCompanion copyWith(
      {Value<int>? id,
      Value<String>? linkimage,
      Value<String>? name,
      Value<String>? email,
      Value<String>? gender,
      Value<int>? contact,
      Value<String>? password,
      Value<DateTime>? dob}) {
    return DbUserCompanion(
      id: id ?? this.id,
      linkimage: linkimage ?? this.linkimage,
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      contact: contact ?? this.contact,
      password: password ?? this.password,
      dob: dob ?? this.dob,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (linkimage.present) {
      map['linkimage'] = Variable<String>(linkimage.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (contact.present) {
      map['contact'] = Variable<int>(contact.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (dob.present) {
      map['dob'] = Variable<DateTime>(dob.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbUserCompanion(')
          ..write('id: $id, ')
          ..write('linkimage: $linkimage, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('gender: $gender, ')
          ..write('contact: $contact, ')
          ..write('password: $password, ')
          ..write('dob: $dob')
          ..write(')'))
        .toString();
  }
}

abstract class _$UsersDatabase extends GeneratedDatabase {
  _$UsersDatabase(QueryExecutor e) : super(e);
  $UsersDatabaseManager get managers => $UsersDatabaseManager(this);
  late final $DbUserTable dbUser = $DbUserTable(this);
  late final UsersDao usersDao = UsersDao(this as UsersDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dbUser];
}

typedef $$DbUserTableCreateCompanionBuilder = DbUserCompanion Function({
  Value<int> id,
  required String linkimage,
  required String name,
  required String email,
  required String gender,
  required int contact,
  required String password,
  required DateTime dob,
});
typedef $$DbUserTableUpdateCompanionBuilder = DbUserCompanion Function({
  Value<int> id,
  Value<String> linkimage,
  Value<String> name,
  Value<String> email,
  Value<String> gender,
  Value<int> contact,
  Value<String> password,
  Value<DateTime> dob,
});

class $$DbUserTableFilterComposer
    extends Composer<_$UsersDatabase, $DbUserTable> {
  $$DbUserTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get linkimage => $composableBuilder(
      column: $table.linkimage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dob => $composableBuilder(
      column: $table.dob, builder: (column) => ColumnFilters(column));
}

class $$DbUserTableOrderingComposer
    extends Composer<_$UsersDatabase, $DbUserTable> {
  $$DbUserTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get linkimage => $composableBuilder(
      column: $table.linkimage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dob => $composableBuilder(
      column: $table.dob, builder: (column) => ColumnOrderings(column));
}

class $$DbUserTableAnnotationComposer
    extends Composer<_$UsersDatabase, $DbUserTable> {
  $$DbUserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get linkimage =>
      $composableBuilder(column: $table.linkimage, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<int> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<DateTime> get dob =>
      $composableBuilder(column: $table.dob, builder: (column) => column);
}

class $$DbUserTableTableManager extends RootTableManager<
    _$UsersDatabase,
    $DbUserTable,
    DbUserData,
    $$DbUserTableFilterComposer,
    $$DbUserTableOrderingComposer,
    $$DbUserTableAnnotationComposer,
    $$DbUserTableCreateCompanionBuilder,
    $$DbUserTableUpdateCompanionBuilder,
    (DbUserData, BaseReferences<_$UsersDatabase, $DbUserTable, DbUserData>),
    DbUserData,
    PrefetchHooks Function()> {
  $$DbUserTableTableManager(_$UsersDatabase db, $DbUserTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DbUserTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DbUserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DbUserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> linkimage = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> gender = const Value.absent(),
            Value<int> contact = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<DateTime> dob = const Value.absent(),
          }) =>
              DbUserCompanion(
            id: id,
            linkimage: linkimage,
            name: name,
            email: email,
            gender: gender,
            contact: contact,
            password: password,
            dob: dob,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String linkimage,
            required String name,
            required String email,
            required String gender,
            required int contact,
            required String password,
            required DateTime dob,
          }) =>
              DbUserCompanion.insert(
            id: id,
            linkimage: linkimage,
            name: name,
            email: email,
            gender: gender,
            contact: contact,
            password: password,
            dob: dob,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DbUserTableProcessedTableManager = ProcessedTableManager<
    _$UsersDatabase,
    $DbUserTable,
    DbUserData,
    $$DbUserTableFilterComposer,
    $$DbUserTableOrderingComposer,
    $$DbUserTableAnnotationComposer,
    $$DbUserTableCreateCompanionBuilder,
    $$DbUserTableUpdateCompanionBuilder,
    (DbUserData, BaseReferences<_$UsersDatabase, $DbUserTable, DbUserData>),
    DbUserData,
    PrefetchHooks Function()>;

class $UsersDatabaseManager {
  final _$UsersDatabase _db;
  $UsersDatabaseManager(this._db);
  $$DbUserTableTableManager get dbUser =>
      $$DbUserTableTableManager(_db, _db.dbUser);
}

mixin _$UsersDaoMixin on DatabaseAccessor<UsersDatabase> {
  $DbUserTable get dbUser => attachedDatabase.dbUser;
}
