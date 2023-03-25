import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() {
  // fungsi utama untuk memulai aplikasi Flutter
  // menjalankan aplikasi yang didefinisikan di MyApp
  runApp(MyApp());
}

// StatelessWidget adalah widget yang tidak mempunyai mutable state, yaitu data yang dapat
//berubah pada suatu waktu, sehingga dapat dianggap sebagai widget yang immutable atau tidak dapat diubah.
// StatelessWidget biasanya digunakan untuk menampilkan data yang tidak perlu berubah, seperti
// teks atau gambar.
class MyApp extends StatelessWidget {
  // konstruktor const MyApp({super.key}) digunakan untuk menetapkan key untuk
  //widget utama aplikasi, yaitu MyApp.
  const MyApp({super.key});

  @override
  // Metode build menerima parameter BuildContext context, yang menyediakan akses ke berbagai
  //fitur dan properti dari widget. Context ini digunakan untuk melakukan navigasi, membangun subtree widget baru, dan
  //mengambil data dari widget yang lebih tinggi di dalam hierarki widget.
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // app-wide state
      create: (context) => MyAppState(),
      child: MaterialApp(
        // title app
        title: 'Namer App',
        // defines the visual theme
        theme: ThemeData(
          useMaterial3: true,
          // skema warna pada aplikasi
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        // rute default pada saat membuka aplikasi yaitu class MyHomePage
        // the starting point of your app.
        home: MyHomePage(),
      ),
    );
  }
}

// MyAppState defines the data the app needs to function.
// ChangeNotifier can notify others about its own changes.
// For example, if the current word pair changes, some widgets in the app need to know.
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  // getNext() method reassigns current with a new random WordPair
  // It also calls notifyListeners()(a method of ChangeNotifier)
  //that ensures that anyone watching MyAppState is notified.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  // added a new property to MyAppState called favorites. This property is initialized with an empty list: []
  // also specified that the list can only ever contain word pairs: <WordPair>[], using generics
  var favorites = <WordPair>[];

  // toggleFavorite(), which either removes the current word pair from the list of favorites (if it's already there), or adds it (if it isn't there yet).
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/* 
_MyHomePageState. This class extends State, and can therefore manage its own values. (It can change itself.) Also notice that the build method from the old, stateless widget has moved to the _MyHomePageState (instead of staying in the widget). It was moved verbatim—nothing inside the build method changed. It now merely lives somewhere else 
*/
/*
The underscore (_) at the start of _MyHomePageState makes that class private and is enforced by the compiler. 
*/
class _MyHomePageState extends State<MyHomePage> {

  // variable untuk navigasi yang dipilih default adalah 0 = home, 1 = favorites
  var selectedIndex = 0;

  @override
  // Every widget defines a build() method that's automatically called every time
  // the widget's circumstances change so that the widget is always up to date.
  Widget build(BuildContext context) {

    // The code declares a new variable, page, of the type Widget
    Widget page;
    // Then, a switch statement assigns a screen to page, according to the current value in selectedIndex.
    /*
    Since there's no FavoritesPage yet, use Placeholder; a handy widget that draws a crossed rectangle wherever you place it, marking that part of the UI as unfinished. 
    */
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // LayoutBuilder. It lets you change your widget tree depending on how much available space you have.
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [

            // The SafeArea ensures that its child is not obscured by a hardware notch or a status bar
            SafeArea(
              child: NavigationRail(
                // This shows the labels next to the icons
                extended: constraints.maxWidth >= 600,
                // The navigation rail has two destinations (Home and Favorites), 
                // with their respective icons and labels.
                destinations: [
                  // navigasi ke home
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  // navigasi ke favorites
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                // The navigation rail also defines what happens when the user 
                //selects one of the destinations with onDestinationSelected
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            // If you want to get a better feel of the role of this widget, 
            //try wrapping the NavigationRail widget with another Expanded.
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

// class untuk generate word pair - halaman home
class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // GeneratorPage tracks changes to the app's current state using the watch method.
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    // icon
    IconData icon;
    if (appState.favorites.contains(pair)) {
      // icon setelah ditekan terdapat border
      icon = Icons.favorite;
    } else {
      // icon sebelum ditekan
      icon = Icons.favorite_border;
    }

    return Center(
      // Column is one of the most basic layout widgets in Flutter. It takes any number of children and puts them in a
      //column from top to bottom. By default, the column visually places its children at the top. You'll soon change
      //this so that the column is centered.
      child: Column(
        // fungsi agar column berada di tengah
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          // The Row widget is the horizontal equivalent of Column
          Row(
            // This tells Row not to take all available horizontal space
            mainAxisSize: MainAxisSize.min,
            children: [
              // fungsi untuk memanggil tombol, dilanjutkan dengan adanya icon
              ElevatedButton.icon(
                // ketika tombol ditekan maka akan memanggil fungsi toggleFavorite()
                onPressed: () {
                  appState.toggleFavorite();
                },
                // icon yang digunakan adalah icon favorite (baris 129)
                icon: Icon(icon),
                // pada tombol terdapat label dengan nama 'like'
                label: Text('Like'),
              ),
              // SizedBox to keep the two buttons a bit apart
              SizedBox(width: 10),

              // tombol next untuk menampilkan random word selanjutnya
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class untuk membungkus random word
class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    // theme of app
    var theme = Theme.of(context);

    // digunakan untuk memperbaiki tampilan & ukuran text agar mudah dibaca
    // displayMedium property could theoretically be null
    // ! operator ("bang operator")
    // Calling copyWith() on displayMedium returns a copy of the text style with
    // the changes you define. In this case, you're only changing the text's color.
    var style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary);

    return Card(
      // warna yang ditampilkan di semua bagian aplikasi
      // primary is the most prominent, defining color of the app
      color: theme.colorScheme.primary,
      
      shadowColor: Colors.black,
      // shadow
      elevation: 10,
      // padding adalah tata letak atau layout yang digunakan untuk menambahkan ruang putih di sekitar sebuah widget
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          // memanggil variable style (baris 202)
          style: style,
          // semanticLabel agar text bisa dibaca oleh mesin (screen readers)
          semanticsLabel: pair.asPascalCase,
        ),
      ),
    );
  }
}

// class untuk halaman favorites
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    // jika halaman favorites kosong
    // return text
    // If the list of favorites is empty, it shows a centered message: No favorites yet*.*
    // Otherwise, it shows a (scrollable) list.
    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    // ListView agar bisa di-scroll
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          // The list starts with a summary (for example, You have 5 favorites*.*).
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),

        // The code then iterates through all the favorites, and constructs a ListTile widget for each one.
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
