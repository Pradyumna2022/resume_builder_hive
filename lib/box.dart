

import 'package:hive/hive.dart';
import 'package:untitled1/model/resume_model.dart';

class Boxes{

  static Box<ResumeModel> getData()=>Hive.box<ResumeModel>('resume');
}