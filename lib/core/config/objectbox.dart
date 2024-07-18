import 'package:flutter_template_core/db/objectbox.g.dart';
import 'package:flutter_template_core/db/seed/initial_data.dart';
import 'package:flutter_template_core/features/posts/data/db/post_entity.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  ObjectBox._create(this.store) {
    if (store.box<Post>().isEmpty()) {
      _putInitialData();
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

  void _putInitialData() {
    store.box<Post>().putManyAsync(demoPosts);
  }
}
