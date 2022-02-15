import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/data/task_data.dart';
import 'package:todo/presenter/note_presenter.dart';
import 'package:todo/utils/dimens.dart';
import 'package:todo/widgets/task_item.dart';

class CategoryPage extends StatelessWidget {
  
 CategoryPage({ Key? key  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    var categoryType = arg['categoryType'];
     Box box = Hive.box('todoApp');
    return  Consumer<NotePresenter>(builder: (context, presenter, child) =>  Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios)),
        title: Text('${categoryType}'),
        
      ),
      body: ValueListenableBuilder(
                valueListenable: box.listenable() ,
                builder: (context, Box box, widget) {
                
                  return Container(
                    margin: const EdgeInsets.only(top: MARGIN_MEDIUM_3),
                    child: ListView.builder(
                       reverse: true,
          shrinkWrap: true,
          itemCount: box.length,
          itemBuilder: (context, index) {
              TaskData data = box.getAt(index);
              
            return  data.categoryName!.trim().compareTo(categoryType) == 0 ? taskItem(context, data, index ) : Container() ;
          }),
                  ); 
                },
              )
      // body: Center(),
    )
    );
  }
}