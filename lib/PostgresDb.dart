import 'package:postgres/postgres.dart';
// class used to connect to postgres database

class PostgresDb{
  PostgreSQLConnection _connection;

  static Future<PostgresDb> connect(Map<String, dynamic> env) async {

    int _port = 32884;
    String _host = env['DB_HOST'];
    String _user = env['DB_USER'];
    String _pass = env['DB_PASS'];
    String _name = env['DB_NAME'];

    PostgresDb db = PostgresDb();
    db._connection = PostgreSQLConnection(_host, _port, _name, username: _user, password: _pass);
    await db._connection.open();
    return db;
  }

  Future<List<dynamic>> query(String sql, { Map<String, dynamic> values }) async {

    try {
      return await _connection.mappedResultsQuery(sql, substitutionValues: values);
    }
    catch(e) {
      return Future.value([]);
    }
  }
}