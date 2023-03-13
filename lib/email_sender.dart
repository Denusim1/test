import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailSender {
  final String email;
  final String subject;
  final String body;

  EmailSender({required this.email, required this.subject, required this.body});

  Future<void> send() async {
    final url =
        'mailto:$email?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw Exception('Could not launch $url');
      }
    } on PlatformException catch (e) {
      throw Exception('Failed to open email: ${e.toString()}');
    } catch (e) {
      throw Exception('Failed to open email: ${e.toString()}');
    }
  }
}
