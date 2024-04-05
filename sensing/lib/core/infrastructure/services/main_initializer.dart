part of '../../../main.dart';

Future<ProviderContainer?> _mainInitializer() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final messagingInstance = FirebaseMessaging.instance;
  messagingInstance.requestPermission();

  final fcmToken = await messagingInstance.getToken();
  debugPrint('FCM TOKEN: $fcmToken');

  _setAndroidNotification();

  // 通知設定の初期化を行う
  _initNotification();
}

Future<void> _setAndroidNotification() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  if (Platform.isAndroid) {
    final androidImplementation =
    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await androidImplementation?.createNotificationChannel(
      const AndroidNotificationChannel(
        'default_notification_channel',
        'プッシュ通知のチャンネル名',
        importance: Importance.max,
      ),
    );
    await androidImplementation?.requestNotificationsPermission();
  }
}

Future<void> _initNotification() async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // バックグラウンド起動中に通知をタップした場合の処理
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;

    // フォアグラウンド起動中に通知が来た場合の処理

    // フォアグラウンド起動中に通知が来た場合、
    // Androidは通知が表示されないため、ローカル通知として表示する
    // https://firebase.flutter.dev/docs/messaging/notifications#application-in-foreground
    if (Platform.isAndroid) {
      // プッシュ通知をローカルから表示する
      await FlutterLocalNotificationsPlugin().show(
        0,
        notification!.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'default_notification_channel',
            'プッシュ通知のチャンネル名',
            importance: Importance.max, // 通知の重要度の設定
            icon: android?.smallIcon,
          ),
        ),
        payload: json.encode(message.data),
      );
    }
  });

  // ローカルから表示したプッシュ通知をタップした場合の処理を設定
  flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings(
          '@mipmap/ic_launcher'), //通知アイコンの設定は適宜行ってください
      iOS: DarwinInitializationSettings(),
    ),
    onDidReceiveNotificationResponse: (details) {
      if (details.payload != null) {
        final payloadMap =
        json.decode(details.payload!) as Map<String, dynamic>;
        debugPrint(payloadMap.toString());
      }
    },
  );
}
