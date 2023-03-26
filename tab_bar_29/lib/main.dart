import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green[700]),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabC = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        // backgroundColor: Colors.teal,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text("Whatsapp"),
        bottom: TabBar(controller: tabC, tabs: const [
          Tab(
            child: Icon(Icons.groups),
          ),
          Tab(
            text: "Chats",
          ),
          Tab(
            text: "Status",
          ),
          Tab(
            text: "Calls",
          ),
        ]),
      ),
      body: TabBarView(controller: tabC, children: [
        // GROUPS
        const Center(
          child: Text("Groups"),
        ),
        // CHATS
        ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://picsum.photos/id/${index + 50}/200/300"),
                ),
                title: Text(faker.person.name()),
                subtitle: Text(
                  faker.lorem.sentence(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                trailing: Text(
                  faker.date.time(),
                ));
          },
        ),
        // STATUS
        const Center(
          child: Text("Status"),
        ),
        // CALLS
        const Center(
          child: Text("Calls"),
        ),
      ]),
    );
  }
}
