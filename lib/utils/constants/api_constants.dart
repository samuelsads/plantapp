import 'package:flutter_dotenv/flutter_dotenv.dart';

///Base url
String baseUrl = '';

/// Cloud name
String cloudName = dotenv.env['CLOUD_NAME']!;

/// Upload preset
String uploadPreset = dotenv.env['UPLOAD_PRESET']!;
