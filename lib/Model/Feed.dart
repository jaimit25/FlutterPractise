
// static getdata() async {
//     print('datadtadatdatdatdatdatadtadtadtadtadtadtadtad');
//     List<FeedModel> list = [];
//     await FirebaseFirestore.instance
//         .collection("Feed")
//         .get()
//         .then((querySnapshot) {
//       querySnapshot.docs.forEach((document) {
//         list.add(FeedModel(
//           email: document['email'],
//           // Head: document['Head'],
//           body: document['body'],
//           likes: document['likes'],
//           Photo: document['Photo'],
//         ));
//       });
//     });
//     print('xxx');
//     print(list.length);
//     print('yyy');
//     return list;
//   }
// class Feed {
//   String IntExtra, StringExtra, imgUrl, Caption, Name;
//   bool likes;

//   Feed(
//       {this.IntExtra,
//       this.StringExtra,
//       this.imgUrl,
//       this.Caption,
//       this.Name,
//       this.likes});

//   factory Feed.fromDocument(DocumentSnapshot docs) {
//     return Feed(
//       IntExtra: docs['IntExtra'],
//       StringExtra: docs['StringExtra'],
//       imgUrl: docs['imgUrl'],
//       Caption: docs['Caption'],
//       Name: docs['Name'],
//       likes: docs['likes'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'IntExtra': IntExtra,
//       'StringExtra': StringExtra,
//       'imgUrl': imgUrl,
//       'Name': Name,
//       'Caption': Caption,
//       'likes': likes,
//     };
//   }
// }
