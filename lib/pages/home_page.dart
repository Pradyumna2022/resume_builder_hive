
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled1/model/resume_model.dart';
import 'package:untitled1/pages/widget/my_text_field.dart';

import '../box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final aboutController = TextEditingController();
  final educationController = TextEditingController();
  final expController = TextEditingController();
  final locationController = TextEditingController();
  final otherController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ValueListenableBuilder<Box<ResumeModel>>(
          valueListenable: Boxes.getData().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<ResumeModel>();
            return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Resume No. ${index + 1}",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey,width: 0.7
                                ),
                                borderRadius: BorderRadius.circular(3)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    data[index].name!,
                                    style: TextStyle(
                                        fontSize: 30, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.email,
                                          size: 12,
                                          color: Colors.red,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 2.0),
                                          child: Text(
                                            data[index].email!,
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            size: 10,
                                            color: Colors.green,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 2.0),
                                            child: Text(
                                              data[index].phoneNo!,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_location,
                                      size: 10,
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 2.0),
                                      child: SizedBox(
                                        width: MediaQuery.of(context).size.width*0.65,
                                        child: Text(
                                          data[index].location!,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.person,size: 18,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'About Information',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              data[index].about!,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.wb_incandescent_sharp,size: 18,),

                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Experience Information',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              data[index].experience!,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: [
                                Icon(Icons.volunteer_activism,size: 18,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Activity',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              data[index].other!,
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _editDialog(
                                      data[index],
                                      data[index].name.toString(),
                                      data[index].email.toString(),
                                      data[index].phoneNo.toString(),
                                      data[index].about.toString(),
                                      data[index].education.toString(),
                                      data[index].experience.toString(),
                                      data[index].location.toString(),
                                      data[index].other.toString());
                                },
                                child: Text(
                                  "Edit",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pinkAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  deleteItem(data[index]);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pinkAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          _showMyDialog();
          nameController.clear();
          emailController.clear();
          phoneController.clear();
          aboutController.clear();
          educationController.clear();
          expController.clear();
          locationController.clear();
        },
        child: Container(
          margin: EdgeInsets.only(left: 30),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          height: 50,
          width: double.infinity,
          child: Center(
            child: Text(
              "Create a resume",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextField(
                      controller: nameController,
                      hintText: 'Name',
                      requiredName: 'Name',
                    ),
                    MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      requiredName: 'Email',
                    ),
                    MyTextField(
                      controller: phoneController,
                      hintText: 'Phone',
                      requiredName: 'Phone',
                    ),
                    MyTextField(
                      controller: aboutController,
                      hintText: 'About',
                      requiredName: 'About',
                      maxLines: 4,
                    ),
                    MyTextField(
                      controller: educationController,
                      hintText: 'Education',
                      requiredName: 'Education',
                      maxLines: 4,
                    ),
                    MyTextField(
                      controller: expController,
                      hintText: 'Experience',
                      requiredName: 'Experience',
                      maxLines: 4,
                    ),
                    MyTextField(
                      controller: locationController,
                      hintText: 'Location',
                      requiredName: 'Location',
                    ),
                    MyTextField(
                      controller: otherController,
                      hintText: 'Other',
                      requiredName: 'Other',
                    ),
                  ],
                ),
              ),
            ),
            title: Text("Add New Data"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final data = ResumeModel(
                          name: nameController.text,
                          email: emailController.text,
                          phoneNo: phoneController.text,
                          about: aboutController.text,
                          education: educationController.text,
                          experience: expController.text,
                          location: locationController.text,
                          other: otherController.text);
                      final box = Boxes.getData();
                      box.add(data);
                      print(box.add(data).toString() +
                          'THIS IS YOUR DATA OF THE PRINT HERE !!!!!!!!!!!!!!!!!!!');
                      data.save();
                      print(data);
                      nameController.clear();
                      emailController.clear();
                      educationController.clear();
                      expController.clear();
                      otherController.clear();
                      phoneController.clear();
                      aboutController.clear();
                      locationController.clear();
                      print(box.get('0').toString() + '----------------------');
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Add")),
            ],
          );
        });
  }

  Future<void> _editDialog(
    ResumeModel resumeModel,
    String name,
    String email,
    String phoneNo,
    String about,
    String education,
    String experience,
    String location,
    String other,
  ) async {
    nameController.text = name;
    emailController.text = email;
    phoneController.text = phoneNo;
    aboutController.text = about;
    educationController.text = education;
    expController.text = experience;
    locationController.text = location;
    otherController.text = other;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                children: [
                  MyTextField(controller: nameController, hintText: 'Name'),
                  MyTextField(controller: emailController, hintText: 'Email',),
                  MyTextField(
                    controller: phoneController,
                    hintText: 'Phone',
                  ),
                  MyTextField(
                    controller: educationController,
                    hintText: 'Education',
                    maxLines: 4,
                  ),
                  MyTextField(
                    controller: expController,
                    hintText: 'Experience',
                    maxLines: 4,
                  ),
                  MyTextField(
                    controller: aboutController,
                    hintText: 'About',
                    maxLines: 4,
                  ),
                  MyTextField(
                      controller: locationController, hintText: 'Location'),
                  MyTextField(controller: otherController, hintText: 'Other'),
                ],
              ),
            ),
            title: Text("Edit dialog"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () async {
                    resumeModel.name = nameController.text.toString();
                    resumeModel.email = emailController.text.toString();
                    resumeModel.phoneNo = phoneController.text.toString();
                    resumeModel.about = aboutController.text.toString();
                    resumeModel.experience = expController.text.toString();
                    resumeModel.education = educationController.text.toString();
                    resumeModel.other = otherController.text.toString();
                    resumeModel.location = locationController.text.toString();
                    resumeModel.save();
                    nameController.clear();
                    emailController.clear();
                    phoneController.clear();
                    aboutController.clear();
                    expController.clear();
                    educationController.clear();
                    otherController.clear();
                    locationController.clear();

                    Navigator.pop(context);
                  },
                  child: Text("Edit")),
            ],
          );
        });
  }

  void deleteItem(ResumeModel resumeModel) async {
    await resumeModel.delete();
  }
}
