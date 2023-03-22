import 'package:flutter/material.dart';
import 'package:xpenso/DataBase/data_model.dart';
import 'package:xpenso/constans.dart';
import 'package:xpenso/utils/tabs.dart';

class ListBuilder extends StatefulWidget {
  final List<Ledger> tmpList;
  const ListBuilder({super.key, required this.tmpList});

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: DateTime.now(),
      stream: dayBloc.stateStream,
      builder: (context, snapshot) {
        DateTime temp = snapshot.data!;
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: widget.tmpList.length,
          itemBuilder: (context, index) {
            final item = widget.tmpList[index].toString();

            // Dismissable Widget Startes Here
            return Dismissible(
              // Backgroung when the list tile is dragged
              background: Padding(
                padding: EdgeInsets.only(top: h10),
                child: Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      color: expense, borderRadius: BorderRadius.circular(h15)),
                  child: Padding(
                      padding: EdgeInsets.all(h50),
                      child: const Icon(Icons.delete)),
                ),
              ),

              // To display Alert Box when dismissed whether to confirm / Delete
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: MyText(
                        content: 'Are you sure to delete ?',
                        size: cardFontSize,
                      ),
                      content: MyText(
                        content:
                            'This will be permanent action and cannot be reverted',
                        size: cardFontSize,
                      ),
                      actions: [
                        MyButton(
                            content: 'Confirm',
                            height: h50,
                            textSize: cardFontSize,
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            }),
                        MyButton(
                            content: 'Back',
                            height: h50,
                            textSize: cardFontSize,
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            })
                      ],
                    );
                  },
                );
              },

              // Dismiss Action assigning
              key: Key(item),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  widget.tmpList.removeAt(index);
                });

                // Display Snack bar when item deleted

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.white,
                    dismissDirection: DismissDirection.endToStart,
                    duration: const Duration(seconds: 1),
                    content: MyText(
                        content: 'Item ${index.toString()} Delete Sucessfully',
                        size: cardFontSize)));
              },

              // list of values to be displayed designed below
              child: Padding(
                padding: EdgeInsets.only(top: h10),
                child: Container(
                  height: h100 + h25,
                  width: deviceWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(h15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          blurRadius: h05 / 4,
                          offset: Offset(0, h05 / 4),
                        )
                      ]),
                  child: ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: w100 * 2,
                            child: widget.tmpList[index].categoryFlag == false
                                ? expenseList[
                                    widget.tmpList[index].categoryIndex!]
                                : incomeList[
                                    widget.tmpList[index].categoryIndex!]),
                        SizedBox(
                          width: w50,
                        ),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: h20,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.currency_rupee_rounded,
                                    color: Colors.black,
                                    size: cardFontSize * 1.5,
                                  ),
                                  SizedBox(
                                    width: w25,
                                  ),
                                  MyText(
                                    content:
                                        widget.tmpList[index].amount.toString(),
                                    size: cardFontSize * 1.2,
                                    isHeader: true,
                                  ),
                                  SizedBox(
                                    width: w25,
                                  ),
                                  Icon(
                                    widget.tmpList[index].categoryFlag == false
                                        ? Icons.arrow_upward
                                        : Icons.arrow_downward,
                                    color: widget.tmpList[index].categoryFlag ==
                                            false
                                        ? Colors.red
                                        : Colors.green,
                                    size: cardFontSize * 1.5,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h20,
                              ),
                              SizedBox(
                                height: h50,
                                child: MyText(
                                  content:
                                      '${day.format(temp)} : ${widget.tmpList[index].notes}',
                                  size: cardFontSize / 1.1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
