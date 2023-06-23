import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key, required this.nextPageName, required this.nextPageSpace, required this.nextPageGender});
  final String nextPageName;
  final String nextPageSpace;
  final String nextPageGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('確認画面')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('氏名：', style: TextStyle(fontSize: 16)),
                      Text('性別：', style: TextStyle(fontSize: 16)),
                      Text('出身地：', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: const Text(''),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nextPageName, style: const TextStyle(fontSize: 16)),
                      Text(nextPageGender, style: const TextStyle(fontSize: 16)),
                      Text(nextPageSpace, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
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
