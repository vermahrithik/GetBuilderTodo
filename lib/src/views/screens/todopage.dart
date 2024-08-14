import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtodo/src/controllers/taskController.dart';
import 'package:getxtodo/src/models/taskModel.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TaskController taskController = Get.find<TaskController>();
  TextEditingController taskNameController = TextEditingController();

  TextEditingController taskDescriptionController = TextEditingController();

  // List tasks = [{"name":"Hrithik","description":"Flutter Developer"},{"name":"Sahib","description":"Rust Developer"},{"name":"Rayla","description":"Go Developer"}];
  // List tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffc9cfd2),
        title: InkWell(
          onTap: () {
            taskController.x = '';
          },
          child: Text(
            'Todo App with Getx',
            style:
                TextStyle(color: Color(0xff6d7b87), fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: const Color(0xffc9cfd2),
        child: Center(
          child: Container(
            width: 350,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GetBuilder<TaskController>(
                      builder: (context) {
                        return ListView.builder(
                          itemCount: taskController.tasks.length,
                          itemBuilder: (context, index) {
                            final task = taskController.tasks[index];
                            return InkWell(
                              /// Update Task Details :
                              onTap: () {
                                taskNameController.text =
                                taskController.tasks[index].taskName!;
                                taskDescriptionController.text =
                                taskController
                                    .tasks[index].taskDescription!;
                                Get.dialog(
                                  Dialog(
                                    // backgroundColor: Color(0xffedeae7),
                                    shadowColor: Colors.black,
                                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    child: Container(
                                      height: 230,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Edit Task',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                            Container(
                                              height: 50,
                                              width: 250,
                                              margin:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0,
                                                  vertical: 4),
                                              child: TextField(
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey.shade800,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                cursorColor:
                                                Colors.grey.shade500,
                                                controller:
                                                taskNameController,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  const EdgeInsets
                                                      .symmetric(
                                                      vertical: 0.0,
                                                      horizontal: 14.0),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                  ),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                    borderSide: BorderSide(
                                                      color: Colors
                                                          .grey.shade400,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                    borderSide: BorderSide(
                                                      color: Colors
                                                          .grey.shade400,
                                                    ),
                                                  ),
                                                  fillColor:
                                                  Colors.transparent,
                                                  filled: true,
                                                  hintText: 'Enter Task Name',
                                                  hintStyle: TextStyle(
                                                    color: Colors
                                                        .grey.shade800
                                                        .withOpacity(0.8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              width: 250,
                                              margin:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0,
                                                  vertical: 4),
                                              child: TextField(
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey.shade800,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                cursorColor:
                                                Colors.grey.shade500,
                                                controller:
                                                taskDescriptionController,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                  const EdgeInsets
                                                      .symmetric(
                                                      vertical: 0.0,
                                                      horizontal: 14.0),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                  ),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                    borderSide: BorderSide(
                                                      color: Colors
                                                          .grey.shade400,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                    borderSide: BorderSide(
                                                      color: Colors
                                                          .grey.shade400,
                                                    ),
                                                  ),
                                                  fillColor:
                                                  Colors.transparent,
                                                  filled: true,
                                                  hintText:
                                                  'Enter Task Description',
                                                  hintStyle: TextStyle(
                                                    color: Colors
                                                        .grey.shade800
                                                        .withOpacity(0.8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  style: TextButton.styleFrom(
                                                      shape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              8)),
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal:
                                                          16)),
                                                  child: Text('Cancel',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey.shade700,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600)),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    if(taskNameController.text.toString()=="" || taskDescriptionController.text.toString()==""){
                                                      Get.back();
                                                      Get.snackbar(
                                                          'task edit message',
                                                          'task details are mandatory to add, to update task!',
                                                          backgroundColor: Colors.red.withOpacity(0.8),
                                                          barBlur: 4,
                                                          colorText: Colors.white,
                                                          boxShadows: [BoxShadow(color: Colors.white.withOpacity(0.5),offset: Offset(-2,-2),blurRadius: 4,spreadRadius: 1),BoxShadow(color: Colors.grey.withOpacity(0.5),offset: Offset(2,2),blurRadius: 4,spreadRadius: 1)]
                                                      );
                                                      print('task details are mandatory to add, to update task!');
                                                    }else{
                                                      taskController.editTask(index,taskNameController.text,taskDescriptionController.text);
                                                      Get.back();
                                                      print('${taskController.tasks[index].taskName}');
                                                      Get.snackbar(
                                                          'task edit message',
                                                          'task Updated successfully!',
                                                          backgroundColor: Color(0xff6d7b87).withOpacity(0.8),
                                                          barBlur: 4,
                                                          colorText: Color(0xffc9cfd2),
                                                          boxShadows: [BoxShadow(color: Colors.white.withOpacity(0.5),offset: Offset(-2,-2),blurRadius: 4,spreadRadius: 1),BoxShadow(color: Colors.grey.withOpacity(0.5),offset: Offset(2,2),blurRadius: 4,spreadRadius: 1)]
                                                      );
                                                    }
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: Colors
                                                          .amberAccent
                                                          .shade400,
                                                      shape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              8)),
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal:
                                                          16)),
                                                  child: const Text('Update',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600)),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              /// Delete Task :
                              onLongPress: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 150,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Delete Task',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight.w800),
                                            ),
                                            Text(
                                              'Are you sure you want to delete task ?',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: Text('Cancel',
                                                      style: TextStyle(
                                                          color: Colors.grey
                                                              .shade700)),
                                                  style: TextButton.styleFrom(
                                                      shape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              8)),
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal:
                                                          16)),
                                                ),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    taskController.removeTask(index);
                                                    // print(taskController.x);
                                                    print('task deleted successfully!');
                                                    Get.back();
                                                    Get.snackbar('task delete message', 'task deleted successfully!',backgroundColor: Colors.green.withOpacity(0.8),barBlur: 4,colorText: Colors.white,boxShadows: [BoxShadow(color: Colors.white.withOpacity(0.5),offset: Offset(-2,-2),blurRadius: 4,spreadRadius: 1),BoxShadow(color: Colors.grey.withOpacity(0.5),offset: Offset(2,2),blurRadius: 4,spreadRadius: 1)]);
                                                  },
                                                  child: const Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                      const Color(
                                                          0xff773D40),
                                                      shape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              8)),
                                                      padding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal:
                                                          16)),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              /// Task Cards :
                              child: Card(
                                color: const Color(0xffedeae7),
                                child: ListTile(
                                  title: Text(
                                    // taskController.tasks[index].taskName!,
                                    '${taskController.tasks[index].taskName}',
                                    // '${taskController.tasks[index].taskName} : name : ${taskController.x}',
                                    style: const TextStyle(
                                        color: Color(0xff6d7b87),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                  subtitle: Text(
                                      taskController
                                          .tasks[index].taskDescription!,
                                      style: const TextStyle(
                                          color: Color(0xff6d7b87),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                ),
                                shadowColor: const Color(0xffa6a2a6),
                              ),
                            );
                          },
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      // bottomSheet: BottomSheet(onClosing: (){}, builder: ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            taskNameController.clear();
            taskDescriptionController.clear();
            Get.dialog(Dialog(
              // backgroundColor: Color(0xffedeae7),
              shadowColor: Colors.black,
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 230,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Add Task',
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 4),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter Task Name',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.5,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                    width: 1.5,
                                  )),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  )),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 0)),
                          controller: taskNameController,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 4),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter Task Description',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.5,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                    width: 1.5,
                                  )),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  )),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 0)),
                          controller: taskDescriptionController,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Cancel',
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600)),
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 16)),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if(taskNameController.text.toString()=="" || taskDescriptionController.text.toString()==""){
                                Get.back();
                                Get.snackbar(
                                    'task add message',
                                    'task details are mandatory to add task',
                                    backgroundColor: Colors.red.withOpacity(0.8),
                                    barBlur: 4,
                                    colorText: Colors.white,
                                    boxShadows: [BoxShadow(color: Colors.white.withOpacity(0.5),offset: Offset(-2,-2),blurRadius: 4,spreadRadius: 1),BoxShadow(color: Colors.grey.withOpacity(0.5),offset: Offset(2,2),blurRadius: 4,spreadRadius: 1)]
                                );
                                print('adding details of task is mandatory to add task to the tasklist!');
                              }else{
                                taskController.addTask(taskNameController.text, taskDescriptionController.text);
                                Get.back();
                                Get.snackbar(
                                    'task add message',
                                    'task added successfully!',
                                    backgroundColor: Color(0xff6d7b87).withOpacity(0.8),
                                    barBlur: 4,
                                    colorText: Color(0xffc9cfd2),
                                    boxShadows: [BoxShadow(color: Colors.white.withOpacity(0.5),offset: Offset(-2,-2),blurRadius: 4,spreadRadius: 1),BoxShadow(color: Colors.grey.withOpacity(0.5),offset: Offset(2,2),blurRadius: 4,spreadRadius: 1)]
                                );
                                print('task name : ${taskNameController.text},\ntask description : ${taskDescriptionController.text}');
                              }
                            },
                            child: const Text('Add',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade800,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 16)),
                          ),
                          const SizedBox(
                            width: 8,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
            print('Floating action button clicked');
          },
          backgroundColor: const Color(0xffedeae7),
          child: const Icon(
            Icons.add,
            color: Color(0xff6d7b87),
          ),
        ),
      ),
    );
  }

  void validateEmail(String taskName,String taskDesc){

    var rxp = new RegExp(r'');
    // /^[A-Z]$/
  }





}
