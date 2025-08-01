import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/ui/pages/home/widgets/home_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void onSearch(String text) {
    //
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextFormField(
            maxLines: 1,
            controller: textEditingController,
            textInputAction: TextInputAction.done,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: "주소를 입력하세요.",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.pink),
              ),
            ),
            style: TextStyle(fontSize: 13),
          ),
        ),
        body: HomeList(),
      ),
    );
  }
}
