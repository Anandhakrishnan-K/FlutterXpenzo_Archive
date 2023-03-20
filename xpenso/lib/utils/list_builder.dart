import 'package:flutter/material.dart';
import 'package:xpenso/constans.dart';

var list = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
];

class ListBuilder extends StatefulWidget {
  const ListBuilder({super.key});

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];

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
              list.removeAt(index);
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
                    SizedBox(width: w100 * 1.5, child: iconListEx[index]),
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
                                content: '1000',
                                size: cardFontSize * 1.2,
                                isHeader: true,
                              ),
                              SizedBox(
                                width: w25,
                              ),
                              Icon(
                                index % 2 == 0
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                color:
                                    index % 2 == 0 ? Colors.red : Colors.green,
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
                                  'Entered notes to be displayed here ${list.length}',
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
  }
}

// category list

List<Widget> iconListEx = [
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/expenses.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/animal.png'),
    semanticLabel: 'Livestock',
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/bill.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/budget.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/bus.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/cinema.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/electricity.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/faucet.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/food.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/fuel.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/gas.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/haircut.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/internet.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/investment.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/nachos.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/online-shop.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/purchase.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/restaurant.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/stationery.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/subs.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/vegies.png'),
  ),
  ImageIcon(
    color: Colors.black,
    size: h50,
    const AssetImage('assets/icons/wardrobe.png'),
  ),
];
