
import 'package:hive/hive.dart';
part 'resume_model.g.dart';
@HiveType(typeId:0)
class ResumeModel extends HiveObject{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? phoneNo;
  @HiveField(4)
  String? location;
  @HiveField(5)
  String? about;
  @HiveField(6)
  String? experience;
  @HiveField(7)
  String? education;
  @HiveField(8)
  String? other;

  ResumeModel({
     this.email,
     this.name,
     this.about,
     this.education,
     this.experience,
     this.location,
     this.other,
     this.phoneNo
});
}