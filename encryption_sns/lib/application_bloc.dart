import 'dart:async';

class ApplicationBloc {
  final _encryptionController = StreamController<void>();
  final _decryptionController = StreamController<void>();

  StreamSink<void> get encryption => _encryptionController.sink;
  StreamSink<void> get decryption => _decryptionController.sink;


  String _passWord;

  ApplicationBloc() {
    this._passWord = "";

    _bind();
  }

  void _bind() {
    _encryptionController.stream.listen((_) => _encryption());
    _decryptionController.stream.listen((_) => _decryption());
  }

  void dispose() {
    _encryptionController.close();
    _decryptionController.close();
  }

  void setPassWord(String passWord) {
    this._passWord = passWord;
  }

  void _encryption() {
    print("encryption");
  }

  void _decryption() {
    print("decryption");
  }
}