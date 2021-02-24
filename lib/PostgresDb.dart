import 'dart:async';

import 'package:postgres/postgres.dart';
// class used to connect to postgres database

class PostgresDb{
  PostgreSQLConnection _connection;

  static Future<PostgresDb> connect() async {

    PostgresDb db = PostgresDb();
    db._connection = PostgreSQLConnection('localhost', 54321, 'itd-888-database', username: 'user', password: 'password');
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