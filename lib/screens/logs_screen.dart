import 'package:duckcart_app/providers/celebs_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logObj = Provider.of<CelebProvider>(context).logList;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Logs'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: logObj.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          logObj[index].imageUrl,
                        ),
                      ),
                      title: Text(logObj[index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          logObj[index].senderName! == ''
                              ? const Text('Name: none')
                              : Text('Name: ${logObj[index].senderName!}'),
                          logObj[index].message! == ''
                              ? const Text('Message: none')
                              : Text('Message: ${logObj[index].message!}'),
                        ],
                      ),
                      trailing: Column(
                        children: [
                          const Text('Amount'),
                          Text(
                              '${logObj[index].curr!.symbol}${logObj[index].amount!}'),
                        ],
                      ),
                    ),
                    const Divider(),
                  ]);
                }),
          ),
        ),
      ),
    );
  }
}
