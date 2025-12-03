import 'package:basic_design_project/get_services_key.dart';
import 'package:basic_design_project/notification_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.getDeviceToken().then((value) {
      print('Device token');
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notification', style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: ElevatedButton(
        onPressed: () async {
          GetServerKey getServerKey = GetServerKey();

          String acessToken = await getServerKey.getServerKeyToken();
          print(acessToken);
        },
        child: Text('Get Server key'),
      ),
    );
  }
}
