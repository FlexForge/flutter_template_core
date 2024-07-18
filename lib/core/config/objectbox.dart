import 'package:flutter_template_core/db/objectbox.g.dart';
import 'package:flutter_template_core/features/posts/data/db/post_entity.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  ObjectBox._create(this.store) {
    if (store.box<Post>().isEmpty()) {
      _putDemoData();
    }
  }

  /// The Store of this app.
  late final Store store;

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(
      directory: p.join(
        docsDir.path,
        'obx-template',
      ),
    );
    return ObjectBox._create(store);
  }

  void _putDemoData() {
    final demoPosts = [
      Post('Post 1', 'Author 1', body: 'Body 1'),
      Post('Post 2', 'Author 2', body: 'Body 2'),
      Post('Post 3', 'Author 3', body: 'Body 3'),
    ];

    store.box<Post>().putManyAsync(demoPosts);
  }
}
