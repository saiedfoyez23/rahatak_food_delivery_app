import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:googleapis_auth/auth_io.dart';

import '../main.dart';

class PushNotificationController {

  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static String firebaseMessagingScope = "https://www.googleapis.com/auth/firebase.messaging";


  static Future<void> init() async {
    await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true
    );
  }

  static Future localNotificationInit() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@drawable/logo',);
    final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings();
    final LinuxInitializationSettings initializationSettingsLinux = LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsDarwin, linux: initializationSettingsLinux);
    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();
    _flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  }

  // on tap local notification in foreground
  static void onNotificationTap(NotificationResponse notificationResponse) {
    MyApp.navigatorKey.currentState!.pushNamed("/message", arguments: notificationResponse);
  }

  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'rfda', 'rahatakfooddeliveryapp',
      importance: Importance.max,
      priority: Priority.high,
    );
    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(threadIdentifier: 'rahatakfooddeliveryapp');
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails,iOS: darwinNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }


  static Future<String> getAccessToken() async {
    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(
            {
              "type": "service_account",
              "project_id": "rahatakapp",
              "private_key_id": "60fcb9f8e6f060a1d178a264791ccd71dca76de6",
              "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCu9eKkG7Cu233Z\n7pBtigjzo0GKvU47p6AV61KfH9Ov+Igi+IdIOUc6OM4VR36w7E7TnVf/9QUIew07\nBtHGLcUCypnCSZpyAkvbjbSPsQarmCWhF696Lp/tadl8dUyhqXr7qublG1nN2lYy\nnIZxpkJ+7E3J2c6vi8+wF/BDpr1nVWzvaENVOWyIPS9YlM9K6umSq3OWnK1BzMvw\n7VK8zdNHEBZYPA93Oc0hw6DmNBnfEofYmKp6pAeH6Kk+mgBxVlsz2I5tmCgrhYPi\nuh70Giv5Kx8EZpuWyfpv2Tegm9IXEtyhLJjt1Uhg63J3Djru4SgP0Vez97ZCESxu\nSFEB1DPHAgMBAAECggEAEEJsmhiyrkVaqEap6GwkEdRRsn2OSC/3SiIw7vXLu/ZK\nXImhNN6R1oDR8htPVEzZtIPSWkige53H6HzlQNgfD3fZmzsw3biF6TT9mz714juE\n/7gOSDoOBcfI/O5/vSRdeAb1Z0RH78ADM7flLKmpU1dNkV0q/phtKC3JV9gmkPQx\nTO3jduQvOGx5Mx1lmI+u9jVih2/GGSqbKdTcGKZg4AUCNhH2s143g28kr8YQAdcX\nZ1T3o9po5W6znTgryB6YeNiuod+jRZ1wR60iIgfKEpCgSTz094/nrw8CUsX1xuRx\nFs8fTfJ+fI0VFDXWdS9DT6fUtpVDEHcOoBwuX5jQBQKBgQDt5h2Woc3/jF0FO7Lp\nMRdkzwzKKkD0U3uMFC6iSxzP85Zc5cLT8sbflcsYgXUwyzihcxE7o8BLW4L7r5Uw\nZYP45GNpzRpLU2a5Z0/FfzHjYvFIv197qFvIyzUDVdlWHbUVApYSdSHDn/gFGV+s\n2n8YTzOrAxYV5BUTRl/rYj7hxQKBgQC8RdTyEGPAA8/Jn4QSswYKeYBoyNalPbrC\nNU6HMEoocfmewMtKNwHYD8y6y1DmLm7E+91DzjUvE40/8NZ+HL7APB23TC8LmE5K\n0vO9wsFQnwX+9oWHhSTbim0KlXCaPmq0oZWd5ts4oXHLAKABL2aZ6s+NRm9FNbD7\naSaQYUMUGwKBgC0rArUl1XHOmZ6zvf1OZ82pDhmYOirpasymzE/eCQNmkUbkDMCn\nGKE81Im7kp+IBiGJMl1rcsgcANt+c8nzjEIGQuXEnlhs5lUPS3MI+lTc5UjVpPBa\nf8q44kDW3OPf0hDCI/IvMRDuX23AaozsEzNvXjT66geP/XxiYTXUunGtAoGBAIFU\nSvpZTdxKAgOTgytBNQYe/pl8VQ4/gDoGWkI9ZsOvv3RRJZR+gtLDz7QFFDZ6cPb5\nuL3qOdhzytTAgOcyocn1wcf3Gl4Rqr51eJ/C1/6krn69I267hF0XEt5xV19tPumE\nEf3c5nxZUozLih4mTImwphB68NaPElsxmR8W4Pg/AoGAC9idE1xViopBXhM+Wi6U\nROhDA8iqlsYENHiEGfqG0tjSvN387M9JbLso1PvnP9AHkFroQfSTVEiKH/xgGgUQ\nAiMausuvyll/OVQh78Z3dFZcNvPvcoF9oLjyiM1wrOawkpBjYU3/xN2SjFzrCdPb\nqnp3k9eN5wNYyqYe+OFdk68=\n-----END PRIVATE KEY-----\n",
              "client_email": "firebase-adminsdk-fbsvc@rahatakapp.iam.gserviceaccount.com",
              "client_id": "105992090636651800188",
              "auth_uri": "https://accounts.google.com/o/oauth2/auth",
              "token_uri": "https://oauth2.googleapis.com/token",
              "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
              "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40rahatakapp.iam.gserviceaccount.com",
              "universe_domain": "googleapis.com"
            }
        ),[firebaseMessagingScope]
    );
    final accessToken = client.credentials.accessToken.data;
    return accessToken;
  }

}
