import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/user_models.dart';
import '../provider.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late Stream<List<UserModels>> usersStream;
  List<UserModels> users = [];

  @override
  void initState() {
    super.initState();
    final repository = ref.read(repositoryProvider.notifier);
    usersStream = repository.watchAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;



    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: StreamBuilder<List<UserModels>>(
        stream: usersStream,
        builder: (context, AsyncSnapshot<List<UserModels>> snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No users available'),
            );
          } else {
            users = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3,
                crossAxisCount: screenwidth>700?2:1,

              ),
              shrinkWrap: true,
            //  physics: const NeverScrollableScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return SizedBox(
                  height: 100,
                  child: Slidable(
                    startActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: 0.25,
                      children: [
                        SlidableAction(
                          label: "Delete",
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          onPressed: (context) {
                            deleteUser(user);
                          },
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(msg: user.name ?? 'No name');
                      },
                      child: Card(
                        elevation: 5.8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.brown[300],
                        child: ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: user.linkimg ?? '',
                            height: 120,
                            width: 60,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                          title: Text(user.name ?? 'Unknown Name'),
                          subtitle: Text(
                              'Dob: ${user.dob ?? "Unknown"}\nID: ${user.id ?? "Unknown"}\nPhone: ${user.contact ?? "Unknown"}'),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
           /* return ListView.builder(

              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return SizedBox(
                  height: 100,
                  child: Slidable(
                    startActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: 0.25,
                      children: [
                        SlidableAction(
                          label: "Delete",
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          onPressed: (context) {
                            deleteUser(user);
                          },
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(msg: user.name ?? 'No name');
                      },
                      child: Card(
                        elevation: 5.8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.brown[300],
                        child: ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: user.linkimg ?? '',
                            height: 120,
                            width: 60,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                          title: Text(user.name ?? 'Unknown Name'),
                          subtitle: Text(
                              'Dob: ${user.dob ?? "Unknown"}\nID: ${user.id ?? "Unknown"}\nPhone: ${user.contact ?? "Unknown"}'),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );*/
          }
        },
      ),
    );
  }

  void deleteUser(UserModels user) {
    ref.read(repositoryProvider.notifier).deleteUser(user);
  }


/*
 return GridView.builder(
       padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3.5,
        crossAxisCount: 2,   ),
          shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return SizedBox(
                  height: 100,
                  child: Slidable(
                    startActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: 0.25,
                      children: [
                        SlidableAction(
                          label: "Delete",
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          onPressed: (context) {
                            deleteUser(user);
                          },
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(msg: user.name ?? 'No name');
                      },
                      child: Card(
                        elevation: 5.8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.brown[300],
                        child: ListTile(
                          leading: CachedNetworkImage(
                            imageUrl: user.linkimg ?? '',
                            height: 120,
                            width: 60,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                          title: Text(user.name ?? 'Unknown Name'),
                          subtitle: Text(
                              'Dob: ${user.dob ?? "Unknown"}\nID: ${user.id ?? "Unknown"}\nPhone: ${user.contact ?? "Unknown"}'),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
 */

}
