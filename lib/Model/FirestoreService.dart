class FirestoreService {

  final String StringExtra;
  final String IntExtra;
  final String Name;
  final String imgUrl;
  final String Caption;
  final bool likes;


  FirestoreService({this.Caption,this.Name,this.imgUrl,this.IntExtra,this.StringExtra,this.likes});

  factory FirestoreService.fromJson(Map<String, dynamic> json){
    return FirestoreService(  
      IntExtra: json['likes'],
      StringExtra: json['Caption'],
      likes: json['Name'],
      Name : json['StringExtra'],
      Caption: json['IntExtra'],
      imgUrl : json['imgUrl'],      
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'likes':likes,
     'Caption':Caption,
      'Name':Name,
      'StringExtra':StringExtra,
      'IntExtra':IntExtra,
      'imgUrl':imgUrl,
    };
  }
}
