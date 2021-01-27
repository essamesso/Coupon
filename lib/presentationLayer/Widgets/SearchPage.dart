import 'package:flutter/material.dart';
import 'package:search_widget/search_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<LeaderBoard> list = <LeaderBoard>[
    LeaderBoard("Flutter", 54),
    LeaderBoard("React", 22.5),
    LeaderBoard("Ionic", 24.7),
    LeaderBoard("Xamarin", 22.1),
  ];

  LeaderBoard _selectedItem;

  bool _show = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              if (_show)
                SearchWidget<LeaderBoard>(
                  dataList: list,
                  hideSearchBoxWhenItemSelected: false,
                  listContainerHeight: MediaQuery.of(context).size.height / 4,
                  queryBuilder: (query, list) {
                    return list
                        .where((item) => item.username
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  },
                  popupListItemBuilder: (item) {
                    return PopupListItemWidget(item);
                  },
                  selectedItemBuilder: (selectedItem, deleteSelectedItem) {
                    return SelectedItemWidget(selectedItem, deleteSelectedItem);
                  },
                  // widget customization
                  noItemsFoundWidget: NoItemsFound(),
                  textFieldBuilder: (controller, focusNode) {
                    return MyTextField(controller, focusNode);
                  },
                  onItemSelected: (item) {
                    setState(() {
                      _selectedItem = item;
                    });
                  },
                ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "${_selectedItem != null ? _selectedItem.username : ""
                    "لا توجد بيانات لعرضها"}",
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {
            setState(() {
              _show = !_show;
            });
          },
          child: Icon(Icons.swap_horizontal_circle),
        ),
      ),
    );
  }
}

class LeaderBoard {
  LeaderBoard(this.username, this.score);

  final String username;
  final double score;
}

class SelectedItemWidget extends StatelessWidget {
  const SelectedItemWidget(this.selectedItem, this.deleteSelectedItem);

  final LeaderBoard selectedItem;
  final VoidCallback deleteSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                selectedItem.username,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, size: 22),
            color: Colors.grey[700],
            onPressed: deleteSelectedItem,
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, this.focusNode);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
       // color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.search),
          new Flexible(
            flex: 15,
            child: new TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(5),
                hintText: 'ابحث عن الكوبونات والمتاجر',
              ),
              controller: controller,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

/*
return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x4437474F),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          hintText: "ابحث عن الكوبونات والمتاجر",
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 20,
            top: 14,
            bottom: 14,
          ),
        ),
      ),
    );
*/

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.folder_open,
          size: 24,
          color: Colors.grey[900].withOpacity(0.7),
        ),
        const SizedBox(width: 10),
        Text(
          "No Items Found",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900].withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}

class PopupListItemWidget extends StatelessWidget {
  const PopupListItemWidget(this.item);

  final LeaderBoard item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        item.username,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
