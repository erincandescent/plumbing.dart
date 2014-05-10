library plumbing.models;
import 'dart:async';
import 'package:alchemy/core.dart';

class MediaLink extends SubDocument {
  int get duration;
  set duration(int _);
  
  int get width;
  set width(int _);
  
  int get height;
  set height(int _);
  
  Uri get url => Uri.parse(self["url"]);
  set url(Uri _) { self["url"] = _.toString(); }
}

@DocumentType(
    collectionName: "objects", 
    referenceFields: const["id", "objectType"],
    urlPattern: "/api/{objectType}/{_id}", patternFields: const["objectType", "_id"])
class ActivityObject extends Document {
  // Local
  //ActivityObject(String type) : super({"objectType": type}) {
  //  this["id"] = "http://localhost/api/${type}/${this['_id']}/";
  //}
  
  ActivityObject.forImport(map) : super.forImport(map);
  ActivityObject.revive(map)    : super.revive(map);
  
  @override
  void generateId() {
    throw new AssertionError();
  }
  
  //Future<List<Object>> get attachments;
  Future<ActivityObject> get author; 
  set author(ActivityObject);
  
  String get content;
  set content(String _);
  
  String get displayName;
  set displayName(String _);
  
  List<String> get downstreamDuplicates;
  set downstreamDuplicates(List<String> _);

  List<String> get upstreamDuplicates;
  set upstreamDuplicates(List<String> _);
  
  MediaLink get image;
  set image(MediaLink _);
  
  String get objectType;
  
  DateTime get published => DateTime.parse(this["published"]);
  set published(DateTime dt) { this["published"] = dt.toIso8601String(); }
  
  DateTime get updated => DateTime.parse(this["updated"]);
  set updated(DateTime dt) { this["updated"] = dt.toIso8601String(); }
  
  String get summary;
  set summary(String _);
  
  Uri get url => Uri.parse(this["url"]);
  set url(Uri _) { this["url"] = url.toString(); }
  
  String get avatarImage {
    if(this["image"] != null && this["image"]["url"] != null) {
      return this["image"]["url"];
    } else {
      return "/packages/plumbing/img/noavatar.png";
    }
  }
}

@DocumentType(
    collectionName: "activities", 
    referenceFields: const["id", "verb"],
    urlPattern: "/api/activity/{_id}", patternFields: const["_id"])
class Activity extends Document {
  // Local
  Activity.forImport(map) : super.forImport(map);
  Activity.revive(map)    : super.revive(map);
  
  @override
  void generateId() {
    throw new AssertionError();
  }
  
  Uri    get id => Uri.parse(this["id"]);
  String get verb;
  
  Future<ActivityObject> get actor;
  set actor(ActivityObject _);
  
  String get content;
  set content(String _);

  Future<ActivityObject> get generator;
  set generator(ActivityObject _);
  
  MediaLink get icon;
  set icon(MediaLink _);
  
  Future<ActivityObject> get object;
  set object(ActivityObject _);
  
  Future<ActivityObject> get provider;
  set provider(ActivityObject _);
  
  Future<ActivityObject> get target;
  set target(ActivityObject _);
  
  String get title;
  set title(String _);
  
  DateTime get published => DateTime.parse(this["published"]);
  set published(DateTime dt) { this["published"] = dt.toIso8601String(); }
  
  DateTime get updated => DateTime.parse(this["updated"]);
  set updated(DateTime dt) { this["updated"] = dt.toIso8601String(); }
  
  Uri get url => Uri.parse(this["url"]);
  set url(Uri _) { this["url"] = url.toString(); }
}

