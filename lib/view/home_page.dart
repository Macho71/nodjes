import 'package:backend/model/currency_models.dart';
import 'package:backend/service/currensy_cervice.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Backend App"),
      ),
      body: FutureBuilder(
        future: CurrencyService.getCurrency(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            List<Model> data = snapshot.data as List<Model>;
            return ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    CircleAvatar(
                        backgroundImage:
                            NetworkImage(data[index].img.toString())),
                    Text(data[index].title.toString())
                  ],
                );
              },
              itemCount: data.length,
            );
          }
        },
      ),
    );
  }
}
