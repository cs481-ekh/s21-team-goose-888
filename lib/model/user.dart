import 'package:'

class User extends ManagedObject<_User> implements _User {}

class _User {
  @primaryKey
  int id;

  @Column(unique: false)
  String first_name;

  @Column(unique: false)
  String last_name;

  @Column(unique: false)
  String email;

  @Column(unique: false)
  int waqtc_number;

  @Column(unique: false)
  String user_type;

  @Column(unique: false)
  String pd;