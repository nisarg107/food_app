class Info{
  final String useremail;
  final String uid;

  Info({
    required this.uid,
    required this.useremail
  });

  Map<String,dynamic> toMap(){
    return{
      'uid':uid,
      'email':useremail
    };
  }
}