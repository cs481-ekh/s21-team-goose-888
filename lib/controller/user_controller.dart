import 'dart:async';

import 'package:aqueduct/aqueduct.dart';

class UsersController extends ResourceController {
  UsersController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllUsers({@Bind.query('name') String name}) async {
    final userQuery = Query<User>(context);
    if (name != null) {
      userQuery.where((h) => h.first_name).contains(name, caseSensitive: false);
    }
    final users = await userQuery.fetch();

    return Response.ok(users);
  }

  @Operation.get('id')
  Future<Response> getUserByID(@Bind.path('id') int id) async {
    final userQuery = Query<User>(context)
      ..where((h) => h.id).equalTo(id);

    final user = await userQuery.fetchOne();

    if (user == null) {
      return Response.notFound();
    }
    return Response.ok(user);
  }

  @Operation.post()
  Future<Response> createHero(@Bind.body() User inputHero) async {
    final query = Query<User>(context)
      ..values = inputHero;

    final insertedUser = await query.insert();

    return Response.ok(insertedUser);
  }
}