import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:immverse/viewmodels/dm_viewmodel.dart';
import 'package:immverse/models/user_model.dart';
import 'package:immverse/views/dm_chat_screen.dart';

class DmListScreen extends StatefulWidget {
  const DmListScreen({super.key});

  @override
  State<DmListScreen> createState() => _DmListScreenState();
}

class _DmListScreenState extends State<DmListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<DmViewModel>(
      builder: (context, dmVm, child) {
        final filteredUsers = dmVm.searchUsers(_searchQuery);
        final onlineUsers = filteredUsers.where((u) => u.isOnline).toList();
        final offlineUsers = filteredUsers.where((u) => !u.isOnline).toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text("Direct Messages"),
            backgroundColor: Colors.blue.shade800,
            foregroundColor: Colors.white,
            elevation: 2,
          ),
          body: Container(
            color: Colors.grey.shade50,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (query) {
                        setState(() => _searchQuery = query);
                      },
                      decoration: InputDecoration(
                        hintText: "Search users...",
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.blue.shade600,
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    children: [
                      if (onlineUsers.isNotEmpty) ...[
                        _buildSectionHeader(
                          "ONLINE — ${onlineUsers.length}",
                        ),
                        ...onlineUsers.map((user) => _buildUserTile(user)),
                        const SizedBox(height: 16),
                      ],
                      if (offlineUsers.isNotEmpty) ...[
                        _buildSectionHeader(
                          "OFFLINE — ${offlineUsers.length}",
                        ),
                        ...offlineUsers.map((user) => _buildUserTile(user)),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Colors.grey.shade500,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildUserTile(UserModel user) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DmChatScreen(
                  userName: user.name,
                  isOnline: user.isOnline,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.blue.shade400,
                      child: Text(
                        user.name[0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (user.isOnline)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Colors.green.shade500,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.5,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        user.lastSeen,
                        style: TextStyle(
                          fontSize: 13,
                          color: user.isOnline
                              ? Colors.green.shade600
                              : Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: Colors.blue.shade400,
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}