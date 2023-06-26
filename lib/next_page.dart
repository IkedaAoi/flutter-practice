import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key, required this.nextPageName, required this.nextPageSpace, required this.nextPageGender});

  final String nextPageName;
  final String nextPageSpace;
  final String nextPageGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text('確認画面'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(left: 40, right: 20),
                  width: 170,
                  child: const Text('氏名：', style: TextStyle(fontSize: 16)),
                ),
                Text(nextPageName, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(left: 40, right: 20),
                  width: 170,
                  child: const Text('性別：', style: TextStyle(fontSize: 16)),
                ),
                Text(nextPageGender, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(left: 40, right: 20),
                  width: 170,
                  child: const Text('出身地：', style: TextStyle(fontSize: 16)),
                ),
                Text(nextPageSpace, style: const TextStyle(fontSize: 16)),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: OutlinedButton(
                child: const Text('前の画面に戻る'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
