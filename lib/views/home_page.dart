import 'package:flutter/material.dart';
import 'package:newapiwork/services/remot_services.dart';

import '../models/post.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Newspaper>? newspaper;
  var isLoading = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    newspaper = await Remote_Services().getPosts();
    if (newspaper != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Visibility(
        visible: isLoading,
        child: ListView.builder(
          itemCount: newspaper?.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Container(
                    child: Text(newspaper![index].title,style: TextStyle(color: Colors.blue),),
                  ),
                  Container(child: Text(newspaper![index].body,
                  maxLines: 3,
                  ),)
                ],
              ),
            );
          },
        ),
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
