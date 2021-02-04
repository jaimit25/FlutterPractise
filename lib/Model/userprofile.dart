class userprofile {
  String Email, Name, Password, uid, Photo;

  userprofile({this.Email, this.Name, this.Password, this.uid, this.Photo});

  factory userprofile.fromDocument(doc) {
    return userprofile(
        Email: doc['Email'],
        Name: doc['Name'],
        Password: doc['Password'],
        uid: doc['uid'],
        Photo: doc['Photo']);
  }
}

