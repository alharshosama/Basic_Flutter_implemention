import 'package:cs4_implemention/models/TestModel.dart';
import 'package:cs4_implemention/repository/test_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_test_view.dart';

class TestListView extends StatefulWidget {
 // const TestListView({Key? key}) : super(key: key);

  @override
  State<TestListView> createState() => _TestListViewState();
}

class _TestListViewState extends State<TestListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TestList"),centerTitle: true,),
      body: Container(
        child:FutureBuilder<List<TestModel>>(
          future:TestRepository().getAll(),
          builder:(context,snapchat){
            if(snapchat.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
          else if(snapchat.connectionState == ConnectionState.done){
              if(snapchat.hasError){
                return Center(child: Text("Erorr:${snapchat.error.toString()}"));

              }
             else if(snapchat.hasData){
    var list = snapchat.data ?? [];
    return ListView.separated(
    itemBuilder:(context,index){
    return ListTile(
    leading: Text("${list[index].id}"),
    title: Text("${list[index].name}"),
    subtitle: Text("${list[index].details}"),
    trailing: Icon(Icons.delete),
    );

    },
    separatorBuilder: (context,index){
    return Divider();

    }, itemCount: list.length);

    }

             else{
                return Center(child: Text("Erorr:${snapchat.error.toString()}"));

              }

              }

            else{
              return Center(child: Text("Erorr:${snapchat.error.toString()}"));

            }

          },  ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TextAddView()));

      }),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../models/TestModel.dart';
// import '../repository/test_repository.dart';
//
// class TestListView extends StatefulWidget {
//   const TestListView({Key? key}) : super(key: key);
//
//   @override
//   State<TestListView> createState() => _TestViewState();
// }
//
// class _TestViewState extends State<TestListView> {
//   bool loading = false;
//   @override
//   Widget build(BuildContext ctx) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Tests"), centerTitle: true,),
//       body: loading?Center(child: CircularProgressIndicator()): Container(
//         child: FutureBuilder<List<TestModel>>(
//           future: TestRepository().getAll(),
//           builder: (context, snapshot){
//             if(snapshot.connectionState == ConnectionState.waiting){
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             else if(snapshot.connectionState == ConnectionState.done){
//               if(snapshot.hasError){
//                 return Center(
//                   child: Text("Error: ${snapshot.error}"),
//                 );
//               }
//               else if(snapshot.hasData){
//                 var list = snapshot.data??[];
//                 return RefreshIndicator(
//                   onRefresh: ()async{
//                     setState(() {
//
//                     });
//                   },
//                   child: ListView.separated(
//                       itemBuilder: (context, index){
//                         return ListTile(title: Text("${list[index].name}"),
//                           leading: Text("${list[index].id}"),
//                           subtitle: Text("${list[index].details}"),
//                        //   trailing: IconButton(
//                            // onPressed: ()async{
//                               /* setState(() {
//                                 loading= true;
//                               });*/
//                               // var done=  await showDialog(
//                               //     barrierDismissible: false,
//                               //     context: context,
//                               //     builder: (context){
//                               //       return DeleteTestView(testId: list[index].id??0,);
//                               //     });
//                               // if(done){
//                               //   setState(() {
//                               //
//                               //   });
//                               // }
//                               // else{
//                               //   // if(!context.mounted)
//                               //   //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("deleted faild"), backgroundColor: Colors.red,duration: Duration(seconds: 3),));
//                               // }
//                            // },
//                            // icon: Icon(FontAwesome.trash),),
//                         );
//                       },
//                       separatorBuilder: (context, index){
//                         return Divider(color: Colors.black87,);
//                       }, itemCount: list.length),
//                 );
//               }
//                  else{
//                  return Center(child: Text("Erorr:${snapshot.error.toString()}"));
//
//                    }
//             }
//             else{
//               return Center(child: Text("Erorr:${snapshot.error.toString()}"));
//
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
