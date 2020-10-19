class FormInput {
  String _userName;

  String _passWord;

  int _id;

  FormInput(this._userName, this._passWord);

  FormInput.withId(this._id, this._userName, this._passWord);

  String get userName => _userName;

  String get passWord => _passWord;

  int get id => _id;

  set userName(String username) {
    this._userName = username;
  }

  set passWord(String password) {
    this._passWord = password;
  }

  // function to convert list object into a map

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = this._id;
    }
    map['username'] = this._userName;
    map['password'] = this._passWord;
    return map;
  }

// class constructor to convert map object into a  list object

  FormInput.fromObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._userName = map['username'];
    this._passWord = map['password'];
  }
}
