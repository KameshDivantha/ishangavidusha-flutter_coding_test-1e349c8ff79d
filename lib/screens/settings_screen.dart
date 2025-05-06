import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          _searchFocusNode.unfocus();
        },
        child: CupertinoPageScaffold(
          child: CustomScrollView(
            slivers: [
              CupertinoSliverNavigationBar(
                largeTitle: const Text('Settings'),
                border: null,
                stretch: true,
                trailing: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.person_crop_circle),
                  onPressed: () {},
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: CupertinoSearchTextField(
                      focusNode: _searchFocusNode,
                      placeholder: 'Search settings',
                      style: const TextStyle(color: CupertinoColors.label),
                    ),
                  ),
                ),
              ),
              
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Placeholder settings items
                      _buildSettingsItem(
                        'Notifications',
                        CupertinoIcons.bell,
                        onTap: () {},
                      ),
                      _buildSettingsItem(
                        'Appearance',
                        CupertinoIcons.person,
                        onTap: () {},
                      ),
                      _buildSettingsItem(
                        'Privacy',
                        CupertinoIcons.lock,
                        onTap: () {},
                      ),
                      _buildSettingsItem(
                        'Terms & Conditions',
                        CupertinoIcons.doc_text,
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoActionSheet(
                              title: const Text('Terms & Conditions'),
                              message: const Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl. Nullam euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl.',
                              ),
                              actions: [
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Accept'),
                                ),
                                CupertinoActionSheetAction(
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Decline'),
                                ),
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel'),
                              ),
                            ),
                          );
                        },
                      ),
                      
                      const SizedBox(height: 32),
                      const Text(
                        'Profile Card',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        // TODO: (Bonus) Apply custom visual effect
                        // Requirements:
                        // - Apply a custom visual effect using ImageFilter.shader 
                        // - Create a simple shader (gradient or noise effect)
                        child: const Text(
                          'Profile Card',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem(String title, IconData icon, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: CupertinoColors.separator,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: CupertinoColors.activeBlue),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            const Icon(
              CupertinoIcons.chevron_right,
              color: CupertinoColors.systemGrey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
