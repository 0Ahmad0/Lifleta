import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Trainer {
  String image, name, type_of_work_permit, location;
  double rate;
  bool isFav;

  Trainer({
    required this.image,
    required this.name,
    required this.type_of_work_permit,
    required this.location,
    required this.rate,
    required this.isFav,
  });
}

//advance
class Advance {
  static bool theme = false;
  static String language = 'en';
  static bool isRegisterKEY = false;
  static bool isLogined = false;
  static String token = "";
  static String uid = "";
  static String avatarImage = "";
}


//user
class User {
  String id;
  String uid;
  String name;
  String? firstName;
  String? lastName;
  String? photoUrl;
  String? rate;
  String email;
  String? phoneNumber;
  String? number;
  String password;
  String typeUser;
  String? description;
  String? gender;
  bool active;
  bool band;
  DateTime? dateBirth;
  List<String>? tokens;
  num? wallet;
  String? location;
  num? disKm;
  num? latitude;
  num? longitude;
  User({
    required this.id,
    required this.uid,
    required this.name,
     this.firstName='',
     this.lastName='',
    required this.email,
     this.phoneNumber,
     this.number,
     this.rate,
    required this.password,
    required this.typeUser,
     this.photoUrl,
     this.gender,
     this.dateBirth,
    this.description = "",
    this.active = false,
    this.band = false,
    this.tokens = const[],
    this.wallet = 0,
  //  this.trainerInfo,
    this.disKm=0,
    this.latitude=0,
    this.longitude=0,
    this.location='',

  });

  factory User.fromJson(json) {
    var data;
    if(Map<String,dynamic>().runtimeType!=json.runtimeType)
       data=json.data();
    else
      data=json;
    return User(
        id: json['id'],
        uid: json["uid"],
        name: json["name"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
      number:(data['number']!=null) ? json["number"] : null,
        password: json["password"],
        typeUser: json["typeUser"],
        photoUrl: json["photoUrl"],
        gender: json["gender"],
        active: json["active"],
      band: json["band"],
        dateBirth: json["dateBirth"]!=null?json["dateBirth"].toDate():null,
        // tokens: json["tokens"],
        description: (data['description']!=null) ? json["description"] : "",
        wallet: (data['wallet']!=null) ? json["wallet"] : 0,
      rate: (data['rate']!=null) ? json["rate"] : null,
      disKm: json['disKm'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      location: json['location'],

    );
  }
  factory User.init(){
    return User(id: "", uid: '', name: '', email: '', phoneNumber: '',number:'', password: '', typeUser: '', photoUrl: "", gender: "", dateBirth: DateTime.now());
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'uid': uid,
    'name': name,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'phoneNumber': phoneNumber,
    'number': number,
    'password': password,
    'typeUser': typeUser,
    'gender': gender,
    'dateBirth':dateBirth!=null?Timestamp.fromDate(dateBirth!):dateBirth,
    'photoUrl': photoUrl,
    'rate': rate,
    'description': description,
    'active': active,
    'band': band,
    'tokens': tokens,
    'wallet': wallet,
    'disKm': disKm,
    'latitude': latitude,
    'longitude': longitude,
    'location': location,

  };
}
//users
class Users {
  List<User> users;

  //DateTime date;

  Users({required this.users});

  factory Users.fromJson(json) {
    List<User> tempUsers = [];

    for (int i = 0; i < json.length; i++) {
      User tempUser = User.fromJson(json[i]);
      tempUser.id = json[i].id;
      tempUsers.add(tempUser);
    }
    return Users(users: tempUsers);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> tempUsers = [];
    for (User user in users) {
      tempUsers.add(user.toJson());
    }
    return {
      'users': tempUsers,
    };
  }


}

//TrainerInfo
class TrainerInfo {
  String nationality;
  String city;
  String neighborhood;
  String idNumber;
  String cvUrl;
  String idLicence;
  String haveCar;
  String workInDrivingSchools;
  String trainedFemaleStudents;
  String priceInHerCar;
  String priceInYourCar;
  String numberOfHour;
  String imageIDFileUrl;
  String carLicenceFileUrl;
  String carRegistrationFileUrl;
  String carImageFileUrl;
  String selfEmploymentLicenseFileUrl;
  String otherImageFileUrl;
  String typeOfWork;


  TrainerInfo({
    required this.nationality,
    required this.city,
    required this.neighborhood,
    required this.idNumber,
    required this.cvUrl,
    required this.idLicence,
    required this.haveCar,
    required this.workInDrivingSchools,
    required this.trainedFemaleStudents,
    required this.priceInHerCar,
    required this.priceInYourCar,
    required this.numberOfHour,
    required this.imageIDFileUrl,
    required this.carLicenceFileUrl,
    required this.carRegistrationFileUrl,
    required this.carImageFileUrl,
    required this.selfEmploymentLicenseFileUrl,
    required this.otherImageFileUrl,
     this.typeOfWork='رخصة عمل حر',

  });

  factory TrainerInfo.fromJson(json) {
    //print(json);
    return TrainerInfo(
      nationality: json['nationality'],
      city: json['city'],
      neighborhood: json['neighborhood'],
      idNumber: json['idNumber'],
      cvUrl: json['cvUrl'],
      idLicence: json['idLicence'],
      haveCar: json['haveCar'],
      workInDrivingSchools: json['workInDrivingSchools'],
      trainedFemaleStudents: json['trainedFemaleStudents'],
      priceInHerCar: json['priceInHerCar'],
      priceInYourCar: json['priceInYourCar'],
      numberOfHour: json['numberOfHour'],
      imageIDFileUrl: json['imageIDFileUrl'],
      carLicenceFileUrl: json['carLicenceFileUrl'],
      carRegistrationFileUrl: json['carRegistrationFileUrl'],
      carImageFileUrl: json['carImageFileUrl'],
      selfEmploymentLicenseFileUrl: json['selfEmploymentLicenseFileUrl'],
      otherImageFileUrl: json['otherImageFileUrl'],
      typeOfWork: json['typeOfWork'],



    );
  }
  factory TrainerInfo.init(){
    return TrainerInfo(nationality: '', city: '', neighborhood: '', idNumber: '', cvUrl: '',
        idLicence: '', haveCar: '', workInDrivingSchools: '', trainedFemaleStudents: '',
        priceInHerCar: '', priceInYourCar: '', numberOfHour: '', imageIDFileUrl: '',
        carLicenceFileUrl: '', carRegistrationFileUrl: '', carImageFileUrl: '',
        selfEmploymentLicenseFileUrl: '', otherImageFileUrl: '');
  }

  Map<String, dynamic> toJson() => {
    'nationality': nationality,
    'city': city,
    'neighborhood': neighborhood,
    'idNumber': idNumber,
    'cvUrl': cvUrl,
    'idLicence': idLicence,
    'haveCar': haveCar,
    'workInDrivingSchools': workInDrivingSchools,
    'trainedFemaleStudents': trainedFemaleStudents,
    'priceInHerCar': priceInHerCar,
    'priceInYourCar': priceInYourCar,
    'numberOfHour': numberOfHour,
    'imageIDFileUrl': imageIDFileUrl,
    'carLicenceFileUrl': carLicenceFileUrl,
    'carRegistrationFileUrl': carRegistrationFileUrl,
    'carImageFileUrl': carImageFileUrl,
    'selfEmploymentLicenseFileUrl': selfEmploymentLicenseFileUrl,
    'otherImageFileUrl': otherImageFileUrl,
    'typeOfWork': typeOfWork,

  };
}



//Report
class Report {
  String id;
  String idUser;
  String idEmployee;
  String numReport;
  String subject;
  String description;
  String replay;
  DateTime dateTime;
  List<String> files;
  List<String> states;
  String status;
  String reportType;
  Location? location;
  bool notificationAdmin;
  bool notificationUser;
  Report({
    this.id="",
     this.idUser='',
     this.idEmployee='',
     this.numReport='',
     this.replay='',
     this.location,
    required this.status,
    required this.reportType,
    required this.description,
    required this.subject,
    required this.dateTime,
    required this.files,
    required this.states,
     this.notificationUser=false,
     this.notificationAdmin=false,
  });

  factory Report.fromJson(json) {
    List<String> listTemp1=[];
    for(String temp in json['files'])
      listTemp1.add(temp);

    List<String> listTemp2=[];
    for(String temp in json['states'])
      listTemp2.add(temp);
    return Report(
        id: json['id'],
        idUser: json['idUser'],
        subject: json['subject'],
        idEmployee: json['idEmployee'],
        description: json['description'],
        numReport: json['numReport'],
        replay: json['replay'],
        status: json['status'],
        reportType: json['reportType'],
        files: listTemp1,
        states: listTemp2,
        notificationAdmin: json['notificationAdmin'],
        notificationUser: json['notificationUser'],
        location:json['location']==null?null: Location.fromJson(json['location']),

        dateTime: json['dateTime'].toDate());
  }

  Map<String, dynamic> toJson() {

    return {
      'id': id,
      'idUser': idUser,
      'idEmployee': idEmployee,
      'description': description,
      'subject': subject,
      'replay': replay,
      'status': status,
      'numReport': numReport,
      'notificationUser': notificationUser,
      'notificationAdmin': notificationAdmin,
      'dateTime': dateTime,
      'files':files,
      'states':states,
      'reportType':reportType,
      'location': location?.toJson()??null,
    };
  }
  factory Report.init(){
    return Report(idUser: '', numReport: '', dateTime: DateTime.now(), description: '', subject: '', files: [], states: [StateReports.Suspended.name], status: '${StateReports.Suspended.name}', reportType: ReportType.None.name);
  }
}

//Reports
class Reports {

  List<Report> listReport;

  //DateTime date;
  Reports({
    required this.listReport});

  factory Reports.fromJson(json) {
    List<Report> temp = [];
    for (int i = 0; i < json.length; i++) {
      Report tempElement = Report.fromJson(json[i]);
      tempElement.id = json[i].id;
      temp.add(tempElement);
    }
    return Reports(
        listReport: temp);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> temp = [];
    for (var element in listReport) {
      temp.add(element.toJson());
    }
    return {
      'listReport': temp,
    };
  }
  factory Reports.init()=>Reports(listReport: []);
}

//Location
class Location {
  String id;
  String? suburb;
  String? province;
  String? state;
  String? postcode;
  String? country;
  String? country_code;
  num? latitude;
  num? longitude;
  Location({
     this.id='',
     this.suburb='',
     this.province='',
    this.state='',
    this.postcode='',
    this.country='',
    this.country_code='',
    this.latitude=0,
    this.longitude=0,
  });

  factory Location.fromJson(json) {
    var data;
    if(Map<String,dynamic>().runtimeType!=json.runtimeType)
      data=json.data();
    else
      data=json;
    return Location(
      id: json['id'],
      suburb: json["suburb"],
      province: json["province"],
      state: json["state"],
      postcode: json["postcode"],
      country: json["country"],
      country_code: json["country_code"],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
  factory Location.init(){
    return Location(id: "",);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'suburb': suburb,
    'state': state,
    'postcode': postcode,
    'country': country,
    'country_code': country_code,
    'latitude': latitude,
    'longitude': longitude,
  };
}

//DateTrainer
class DateTrainer {
  String id;
  String idTrainer;
  TimeOfDay? from;
  TimeOfDay? to;
  DateTime dateTime;
  String? day;
  DateTrainer({
    this.id="",
    required this.idTrainer,
    required this.from,
    required this.to,
    required this.dateTime,
    required this.day,
  });

  factory DateTrainer.fromJson(json) {
    return DateTrainer(
      id: json['id'],
      idTrainer: json['idTrainer'],
      dateTime: json['dateTime'].toDate(),
      day: json['day'],
      from: (json["from"]==null)?json["from"]: TimeOfDay.fromDateTime(json["from"].toDate()),
      to: (json["to"]==null)?json["to"]:TimeOfDay.fromDateTime(json["to"].toDate()),);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'idTrainer': idTrainer,
    'dateTime': Timestamp.fromDate(dateTime),
    'day': day,
    'from': (from==null)?from:DateTime(dateTime.year,dateTime.month,dateTime.day,from!.hour,from!.minute),
    // 'from': (from==null)?from:DateTime.fromMillisecondsSinceEpoch(((from!.hour-3)*60+from!.minute)*60000),
    'to': (to==null)?to:DateTime(dateTime.year,dateTime.month,dateTime.day,to!.hour,to!.minute),
  };
  factory DateTrainer.init()=>
      DateTrainer(idTrainer: '', from: TimeOfDay.now(), to: TimeOfDay.now(), dateTime: DateTime.now(), day: '');
}
//DateTrainers
class DateTrainers {
  List<DateTrainer> listDateTrainer;

  //DateTime date;

  DateTrainers({required this.listDateTrainer});

  factory DateTrainers.fromJson(json) {
    List<DateTrainer> temp = [];
    for (int i = 0; i < json.length; i++) {
      DateTrainer tempElement = DateTrainer.fromJson(json[i]);
      tempElement.id = json[i].id;
      temp.add(tempElement);
    }
    return DateTrainers(listDateTrainer: temp);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> temp = [];
    for (var element in listDateTrainer) {
      temp.add(element.toJson());
    }
    return {
      'listDateTrainer': temp,
    };
  }
}

//Course
class Course {
  String id;
  String idTrainer;
  TimeOfDay? from;
  TimeOfDay? to;
  DateTime dateTime;
  String category;
  String name;
  num? durationInDays;
  num? priceInTrainerCar;
  num? priceInPersonalCar;
  String description;
  String state;
  Course({
    this.id="",
    required this.idTrainer,
    required this.from,
    required this.to,
    required this.dateTime,
    required this.category,
    required this.name,
     this.durationInDays,
     this.priceInTrainerCar,
     this.priceInPersonalCar,
    required this.description,
     this.state='جارية',

  });

  factory Course.fromJson(json) {
    return Course(
        id: json['id'],
      idTrainer: json['idTrainer'],
      category: json['category'],
      name: json['name'],
      durationInDays: json['durationInDays'],
      priceInTrainerCar: json['priceInTrainerCar'],
      priceInPersonalCar: json['priceInPersonalCar'],
      description: json['description'],
      state: json['state'],
      dateTime: json['dateTime'].toDate(),
      from: (json["from"]==null)?json["from"]: TimeOfDay.fromDateTime(json["from"].toDate()),
      to: (json["to"]==null)?json["to"]:TimeOfDay.fromDateTime(json["to"].toDate()),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idTrainer': idTrainer,
      'description': description,
      'priceInPersonalCar': priceInPersonalCar,
      'priceInTrainerCar': priceInTrainerCar,
      'durationInDays': durationInDays,
      'name': name,
      'state': state,
      'category': category,
      'dateTime': Timestamp.fromDate(dateTime),
      'from': (from==null)?from:DateTime(dateTime.year,dateTime.month,dateTime.day,from!.hour,from!.minute),
      'to': (to==null)?to:DateTime(dateTime.year,dateTime.month,dateTime.day,to!.hour,to!.minute),
    };
  }
  factory Course.init(){
    return Course(idTrainer:'', from: null, to: null, dateTime: DateTime.now(), category: '',
        name: '',
        description: '');
  }
}

//Courses
class Courses {

  List<Course> listCourse;

  //DateTime date;
  Courses({
    required this.listCourse});

  factory Courses.fromJson(json) {
    List<Course> temp = [];
    for (int i = 0; i < json.length; i++) {
      Course tempElement = Course.fromJson(json[i]);
      tempElement.id = json[i].id;
      temp.add(tempElement);
    }
    return Courses(
        listCourse: temp);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> temp = [];
    for (var element in listCourse) {
      temp.add(element.toJson());
    }
    return {
      'listCourse': temp,
    };
  }
  factory Courses.init()=>Courses(listCourse: []);
}

//Notification
class Notification {
  String id;
  String idNotification;
  String idUser;
  DateTime dateTime;
  String subtitle;
  String title;
  String message;
  bool checkSend;
  bool checkRec;
  Notification({
    this.id="",
     this.idNotification='',
    required this.idUser,
    required this.subtitle,
    required this.dateTime,
    required this.title,
    required this.message,
    this.checkSend=false,
    this.checkRec=false,
  });

  factory Notification.fromJson(json) {
    return Notification(
      id: json['id'],
      idNotification: json['idNotification'],
      idUser: json['idUser'],
      subtitle: json['subtitle'],
      title: json['title'],
      message: json['message'],
      checkSend: json['checkSend'],
      checkRec: json['checkRec'],
      dateTime: json['dateTime'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idNotification': idNotification,
      'idUser': idUser,
      'subtitle': subtitle,
      'title': title,
      'message': message,
      'checkSend': checkSend,
      'checkRec': checkRec,
      'dateTime': Timestamp.fromDate(dateTime),
    };
  }
  factory Notification.init(){
    return Notification(idUser: '', subtitle: '', dateTime: DateTime.now(), title: '', message: '');
  }
}

//Notifications
class Notifications {

  List<Notification> listNotification;

  //DateTime date;
  Notifications({
    required this.listNotification});

  factory Notifications.fromJson(json) {
    List<Notification> temp = [];
    for (int i = 0; i < json.length; i++) {
      Notification tempElement = Notification.fromJson(json[i]);
      tempElement.id = json[i].id;
      temp.add(tempElement);
    }
    return Notifications(
        listNotification: temp);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> temp = [];
    for (var element in listNotification) {
      temp.add(element.toJson());
    }
    return {
      'listNotification': temp,
    };
  }
  factory Notifications.init()=>Notifications(listNotification: []);
}




//Message
class Message {
  String id;
   bool checkSend;
   num statSend;
   int index;
  String textMessage;
   int sizeFile;
   String url;
  // String urlTempPhoto;
   String localUrl;
   String typeMessage;
  String senderId;
  String receiveId;
  // String replayId;
  DateTime sendingTime;
  // List deleteUserMessage;
  Message(
      {this.id="",
         this.index=-1,
         this.sizeFile=0,
         this.checkSend=true,
         this.statSend=0,
        required this.textMessage,
         this.url="",
        // this.urlTempPhoto="",
         this.localUrl="",
        // required this.replayId,
         required this.typeMessage,
        required this.senderId,
        required this.receiveId,
        // required this.deleteUserMessage,
        required this.sendingTime});
  factory Message.fromJson( json){
    // List<String> tempDeleteUserMessage = [];
    // for(String user in json["deleteUserMessage"]){
    //   tempDeleteUserMessage.add(user);
    // }
     String tempUrl="";
     if(!json["typeMessage"].contains('text')){
       tempUrl=json["url"];
     }
     String tempLocalUrl="";
     tempLocalUrl=json["localUrl"];
     // if(json.containsKey("localUrl")){
     //   tempLocalUrl=json["localUrl"];
     // }
     int tempSizeFile=0;
     tempSizeFile=json["sizeFile"];
     // if(json.containsKey("sizeFile")){
     //   tempSizeFile=json["sizeFile"];
     // }
    // String tempUrlTempPhoto="";
    // if(json.data().containsKey("urlTempPhoto")){
    //   tempUrlTempPhoto=json["urlTempPhoto"];
    // }
    return Message(
       url: tempUrl,
       localUrl: tempLocalUrl,
      textMessage: json["textMessage"],
       typeMessage: json["typeMessage"],
      sendingTime: json["sendingTime"].toDate(),
      senderId: json["senderId"],
      receiveId: json["receiveId"],

      index: json["index"],
      // deleteUserMessage: tempDeleteUserMessage,
      // urlTempPhoto: tempUrlTempPhoto,
       sizeFile: tempSizeFile,
      // replayId: json["replayId"]
    );
  }
  Map<String,dynamic> toJson() {
    // List tempDeleteUserMessage = [];
    // for(String user in deleteUserMessage){
    //   tempDeleteUserMessage.add(user);
    // }

    return {
      'textMessage': textMessage,
        'typeMessage': typeMessage,
      'senderId': senderId,
      'receiveId': receiveId,
      'sendingTime': Timestamp.fromDate(sendingTime),
      'index': index,
      // 'deleteUserMessage': tempDeleteUserMessage,
      // 'urlTempPhoto': urlTempPhoto,
       'sizeFile': sizeFile,
      // 'replayId': replayId,
       'url': url,
       'localUrl': localUrl,
    };
  }
  factory Message.init(){
    return Message(textMessage: '', senderId: '', receiveId: '', sendingTime: DateTime.now(), typeMessage: 'text');
  }
}
//Messages
class Messages {
  List<Message> listMessage;



  Messages({required this.listMessage});

  factory Messages.fromJson(json) {
    List<Message> temp = [];
    for (int i = 1; i < json.length; i++) {
      Message tempElement = Message.fromJson(json[i]);
      tempElement.id = json[i].id;
      temp.add(tempElement);
    }
    return Messages(listMessage: temp);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> temp = [];
    for (var element in listMessage) {
      temp.add(element.toJson());
    }
    return {
      'listMessage': temp,
    };
  }
}
//Chat
class Chat {
  String id;
  List<Message> messages;
  List<String> listIdUser;
  DateTime date;

  Chat({
    this.id='',
    required this.messages,
    required this.listIdUser,
    required this.date,
  });
  factory Chat.fromJson( json){
    List<Message> listTemp = [];
    // for(int i=1;i<json['messages'].length;i++){
    //   Message tempMessage=Message.fromJson(json['messages'][i]);
    //   tempMessage.id=json['messages'][i].id;
    //   listTemp.add(tempMessage);
    // }
    List<String> listTemp2=[];
    for(String temp in json['listIdUser'])
      listTemp2.add(temp);
    return Chat(
      id: json['id'],
      listIdUser: listTemp2,
      messages: listTemp,//json["messages"],
      date: json["date"].toDate(),
    );
  }

  Map<String,dynamic> toJson(){
    List<Map<String,dynamic>> listTemp = [];
    for(Message message in messages){
      listTemp.add(message.toJson());
    }
    return {
      'id':id,
      'date':date,
      // 'messages':listTemp,
      'listIdUser':listIdUser,
    };
  }
  factory Chat.init(){
    return Chat(messages: [], listIdUser: [], date: DateTime.now());
  }
}

//Chats
class Chats {
  List<Chat> listChat;

  //DateTime date;

  Chats({required this.listChat});

  factory Chats.fromJson(json) {
    List<Chat> temp = [];
    for (int i = 0; i < json.length; i++) {
      Chat tempElement = Chat.fromJson(json[i]);
      tempElement.id = json[i].id;
      temp.add(tempElement);
    }
    return Chats(listChat: temp);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> temp = [];
    for (var element in listChat) {
      temp.add(element.toJson());
    }
    return {
      'listChat': temp,
    };
  }
}
enum TypeMessage{
  text,
  image,
  file,
}
enum StateStream{
  Wait,
  Empty,
  Error
}
enum StateReports{
  Suspended,
  Rejected,
  Failing,
  Processing,
  Implemented
}
enum ReportType{
  None,
  Dreft,
}
/*
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations"
flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/translations" -o "locale_keys.g.dart" -f keys
flutter build apk --split-per-abi
temp@gmail.com   123456
 */
