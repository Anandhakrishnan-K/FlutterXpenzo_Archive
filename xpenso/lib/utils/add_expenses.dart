import 'package:flutter/material.dart';
import 'package:xpenso/constans.dart';

// Controllers for the Text Fields 1.Amount 2.Notes
TextEditingController amountController = TextEditingController();
TextEditingController notesController = TextEditingController();

List<bool> selectedIndex1 = List.filled(30, false);

class AddCredit extends StatefulWidget {
  final bool iscredit;
  final Function()? onPressed;
  final String submitButtonName;
  final List<Widget> list;
  const AddCredit(
      {super.key,
      required this.onPressed,
      required this.submitButtonName,
      required this.list,
      required this.iscredit});

  @override
  State<AddCredit> createState() => _AddCreditState();
}

class _AddCreditState extends State<AddCredit> {
  @override
  void initState() {
    super.initState();
    amountController.clear();
    notesController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight * 1.1,
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.cancel_rounded,
              )),
          SizedBox(
            height: h10,
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
              height: h100,
              width: deviceWidth,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return Container(
                      width: h100,
                      decoration: BoxDecoration(
                          color: selectedIndex1[index]
                              ? Colors.grey.shade100
                              : transparent,
                          borderRadius: BorderRadius.circular(h15),
                          border: Border.all(
                            color: selectedIndex1[index]
                                ? Colors.black
                                : transparent,
                          )),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex1 = List.filled(30, false);
                              selectedIndex1[index] = !selectedIndex1[index];
                              catIndex = index;
                            });
                            debugPrint(
                                'Seleted Category Sucessfully $index ${selectedIndex1[index]}');
                          },
                          icon: widget.list[index]));
                },
              )),
          SizedBox(
            height: h25,
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
