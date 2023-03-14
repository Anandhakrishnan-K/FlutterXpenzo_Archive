import 'package:flutter/material.dart';
import 'package:xpenso/constans.dart';

// Controllers for the Text Fields 1.Amount 2.Notes
TextEditingController amountController = TextEditingController();
TextEditingController notesController = TextEditingController();

List<bool> selectedIndex1 = List.filled(expenseList.length, false);
List<Widget> expenseList = [
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/expenses.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/animal.png'),
    semanticLabel: 'Livestock',
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/bill.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/budget.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/bus.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/cinema.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/electricity.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/faucet.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/food.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/fuel.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/gas.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/haircut.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/internet.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/investment.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/nachos.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/online-shop.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/purchase.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/restaurant.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/stationery.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/subs.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/vegies.png'),
  ),
  ImageIcon(
    size: h50,
    const AssetImage('assets/icons/wardrobe.png'),
  ),
];

class AddCredit extends StatefulWidget {
  final Function()? onPressed;
  final String submitButtonName;
  const AddCredit(
      {super.key, required this.onPressed, required this.submitButtonName});

  @override
  State<AddCredit> createState() => _AddCreditState();
}

class _AddCreditState extends State<AddCredit> {
  @override
  void initState() {
    super.initState();
    amountController.clear();
    notesController.clear();
    selectedIndex1 = List.filled(expenseList.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight * 1.075,
      child: Column(
        children: [
          SizedBox(
            height: h20 + h20,
          ),
//******************************* Heading Amount Text ************************/
          MyText(
            content: 'Enter Amount *',
            size: bottomSheetFontsize,
          ),
          SizedBox(
            height: h20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: h05,
              ),
              SizedBox(
                width: h100,
                child: MyButton(
                  textSize: bottomSheetFontsize,
                  content:
                      '- 100', // Button to subtract -100 form the textfield
                  onPressed: () {
                    if (amountController.text.isNotEmpty) {
                      int tmp = int.parse(amountController.text);
                      if (tmp > 100) {
                        tmp -= 100;
                        setState(() {
                          amountController.text = tmp.toString();
                        });
                      } else {
                        setState(() {
                          amountController.clear();
                        });
                      }
                    }
                  },
                  rad: h50,
                  borderColor: transparent,
                  fillColor: transparent,
                ),
              ),
//******************************* Amount Text Box  ************************/
              SizedBox(
                height: h50 + h10,
                width: deviceWidth / 2.5,
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(h05),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(h10)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          amountController.clear();
                        },
                        icon: const Icon(Icons.clear_rounded)),
                  ),
                ),
              ),
              SizedBox(
                width: h100,
                child: MyButton(
                  textSize: bottomSheetFontsize,
                  content: '+ 100', // Button to add 100 to the textfield
                  onPressed: () {
                    amountController.text.isEmpty
                        ? amountController.text = '0'
                        : amountController.text;
                    int tmp = int.parse(amountController.text);
                    tmp += 100;
                    setState(() {
                      amountController.text = tmp.toString();
                    });
                  },
                  rad: h50,
                  borderColor: transparent,
                  fillColor: transparent,
                ),
              ),
              SizedBox(
                width: h05,
              ),
            ],
          ),
//******************************* Heading Category Text ************************/
          SizedBox(
            height: h50,
          ),
          MyText(size: bottomSheetFontsize, content: 'Choose Category *'),
          SizedBox(
            height: h20,
          ),
//******************************* Category List *******************************/
          SizedBox(
              height: h75,
              width: deviceWidth,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: expenseList.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(h15),
                          border: Border.all(
                            color: selectedIndex1[index]
                                ? Colors.black
                                : transparent,
                          )),
                      padding: EdgeInsets.symmetric(horizontal: h10),
                      child: IconButton(
                          onPressed: () {
                            debugPrint('Seleted Category Sucessfully');
                            setState(() {
                              if (selectedIndex1[index] == true) {
                                selectedIndex1[index] = !selectedIndex1[index];
                              } else {
                                selectedIndex1 =
                                    List.filled(expenseList.length, false);
                                selectedIndex1[index] = !selectedIndex1[index];
                              }
                            });
                          },
                          icon: expenseList[index]));
                },
              )),
          SizedBox(
            height: h50,
          ),
//******************************* Notes And Attachments************************/
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: h10,
              ),
              SizedBox(
                width: deviceWidth * 0.65,
                child: TextFormField(
                  controller: notesController,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(h20),
                    hintText: 'Enter Notes (Optional)',
                    suffixIcon: IconButton(
                        onPressed: () {
                          notesController.clear();
                        },
                        icon: const Icon(Icons.clear_rounded)),
                  ),
                ),
              ),
              SizedBox(
                width: h10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.attachment_outlined,
                    size: deviceWidth * 0.1,
                  )),
              SizedBox(
                width: h10,
              ),
            ],
          ),
//******************************* Save button ************************/
          SizedBox(
            height: h50,
          ),
          MyButton(
              textSize: bottomSheetFontsize,
              width: deviceWidth * 0.75,
              content: widget.submitButtonName,
              onPressed: widget.onPressed)
        ],
      ),
    );
  }
}
