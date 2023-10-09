import 'package:banca_creditos_app/domain/models/user.dart';
import 'package:loggy/loggy.dart';

class UserRepository {
  // late TodoLocalDataSource localDataSource;
  //late TodoLocalDataSourceHive localDataSource;

  UserRepository() {
    logInfo("Starting UserRepository");
    //localDataSource = TodoLocalDataSource();
    //localDataSource = TodoLocalDataSourceHive();
  }

  //Future<void> addUser(AppUser user) async => await localDataSource.addTodo(user);

  //Future<List<Todo>> getAllTodos() async => await localDataSource.getAllTodos();

  // Future<void> deleteTodo(id) async => await localDataSource.deleteTodo(id);

  // Future<void> deleteAll() async => await localDataSource.deleteAll();

  /* Future<void> updateTodo(Todo todo) async =>
      await localDataSource.updateTodo(todo);*/
}
