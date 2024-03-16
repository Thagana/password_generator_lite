import 'package:hive/hive.dart';
import 'package:password_repository/password_repository.dart';

class PasswordAdaptor extends TypeAdapter<Password>{
  @override
  final typeId = 0;

  @override
  Password read(BinaryReader reader) {
    return Password.empty();
  }

  @override
  void write(BinaryWriter writer, Password obj) {
    writer.write(obj.password);
  }
}