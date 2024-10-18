import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Effective Date: January 1, 2024',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            _buildSection(
              title: 'Introduction',
              content:
                  'Your privacy is important to us. This privacy policy explains how we collect, use, and protect your personal information when you use our app.',
            ),
            _buildSection(
              title: 'Information We Collect',
              content: 'We may collect the following types of information:\n\n'
                  '- Personal Information: Name, email address, phone number.\n'
                  '- Usage Data: Information about how you use our app.\n'
                  '- Device Information: Device type, operating system, and app version.',
            ),
            _buildSection(
              title: 'How We Use Your Information',
              content:
                  'We use the information we collect for the following purposes:\n\n'
                  '- To provide and maintain our app.\n'
                  '- To notify you about changes to our app.\n'
                  '- To provide customer support.\n'
                  '- To gather analysis or valuable information so that we can improve our app.',
            ),
            _buildSection(
              title: 'Data Security',
              content:
                  'We take the security of your data seriously and implement appropriate technical and organizational measures to protect your personal information.',
            ),
            _buildSection(
              title: 'Third-Party Services',
              content:
                  'We may employ third-party companies and services to facilitate our app, provide the app on our behalf, perform app-related services, or assist us in analyzing how our app is used.',
            ),
            _buildSection(
              title: 'Children’s Privacy',
              content:
                  'Our app does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13.',
            ),
            _buildSection(
              title: 'Changes to This Privacy Policy',
              content:
                  'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.',
            ),
            _buildSection(
              title: 'Contact Us',
              content:
                  'If you have any questions about this Privacy Policy, please contact us:\n\n'
                  'Email: info@example.com\n'
                  'Phone: +1 234 567 890',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
