// ignore_for_file: lines_longer_than_80_chars
// cSpell:dictionaries lorem-ipsum

import 'package:flutter_template_core/features/posts/data/db/post_entity.dart';
import 'package:flutter_template_core/features/user/data/db/user_entity.dart';

final demoUser = User(
  'John',
  'Doe',
  'email@example.com',
  birthDate: DateTime(1980),
  updatedAt: DateTime.now(),
  createdAt: DateTime.now(),
);

final demoPosts = [
  Post(
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Audrey Wright',
    body:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis lectus nulla at volutpat diam. Malesuada fames ac turpis egestas integer eget aliquet nibh praesent. Habitasse platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper. Tortor pretium viverra suspendisse. Sed viverra ipsum nunc aliquet bibendum enim facilisis gravida neque. Enim diam vulputate ut pharetra. Felis eget velit aliquet sagittis id. Faucibus scelerisque eleifend donec pretium vulputate sapien nec. Nunc congue nisi vitae suscipit tellus mauris a diam. Viverra justo nec ultrices dui sapien eget mi proin sed. Turpis egestas pretium aenean pharetra. Ut eu sem integer vitae justo eget magna fermentum iaculis. A arcu cursus vitae congue mauris rhoncus.\n\nEnim sed faucibus turpis in eu. Quis imperdiet massa tincidunt nunc pulvinar sapien. Sit amet consectetur adipiscing elit pellentesque habitant. Suspendisse faucibus interdum posuere lorem. Nunc non blandit massa enim. Nec ultrices dui sapien eget mi proin. Pellentesque elit ullamcorper dignissim cras tincidunt. Cras tincidunt lobortis feugiat vivamus at augue eget. A diam maecenas sed enim ut sem viverra aliquet. Malesuada nunc vel risus commodo viverra maecenas. Et malesuada fames ac turpis egestas integer. Mi proin sed libero enim. Maecenas pharetra convallis posuere morbi leo urna molestie. Lectus quam id leo in vitae turpis massa.',
  ),
  Post(
    'Mi tempus imperdiet nulla malesuada pellentesque',
    'Otis S. Willis',
    body:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget nulla facilisi etiam dignissim diam quis enim lobortis scelerisque. Amet volutpat consequat mauris nunc congue nisi vitae suscipit. Habitasse platea dictumst quisque sagittis purus sit amet volutpat. Nunc congue nisi vitae suscipit. Adipiscing elit ut aliquam purus sit amet luctus. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus. Eu scelerisque felis imperdiet proin fermentum. Justo donec enim diam vulputate ut pharetra sit amet aliquam. Id faucibus nisl tincidunt eget nullam non. Diam sit amet nisl suscipit adipiscing. Nec ullamcorper sit amet risus nullam eget.\n\nTristique sollicitudin nibh sit amet commodo. Quis imperdiet massa tincidunt nunc. Sapien faucibus et molestie ac feugiat sed. Viverra accumsan in nisl nisi scelerisque eu ultrices. Mollis nunc sed id semper risus in. Venenatis tellus in metus vulputate eu. Non consectetur a erat nam at lectus urna. Nisl nunc mi ipsum faucibus vitae aliquet. Justo nec ultrices dui sapien. Tristique magna sit amet purus gravida quis blandit turpis cursus.',
  ),
  Post(
    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Stefan Frisk',
    body:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae sapien pellentesque habitant morbi tristique senectus et. Purus non enim praesent elementum. Mauris cursus mattis molestie a iaculis at erat. In cursus turpis massa tincidunt. Augue mauris augue neque gravida in. Suspendisse ultrices gravida dictum fusce ut placerat orci nulla. Elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Tristique senectus et netus et. At ultrices mi tempus imperdiet nulla. Consectetur adipiscing elit ut aliquam purus sit amet.\n\nRisus in hendrerit gravida rutrum. Vitae et leo duis ut diam quam nulla porttitor. Aenean sed adipiscing diam donec adipiscing tristique risus nec feugiat. Quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. Aliquam sem fringilla ut morbi tincidunt augue interdum velit. Pellentesque elit ullamcorper dignissim cras tincidunt. Fermentum leo vel orci porta non pulvinar neque laoreet. Adipiscing tristique risus nec feugiat in fermentum posuere. Dictumst quisque sagittis purus sit amet volutpat consequat mauris nunc. Praesent semper feugiat nibh sed pulvinar proin gravida hendrerit. In eu mi bibendum neque egestas congue quisque egestas.',
  ),
  Post(
    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Stefan Frisk',
    body:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae sapien pellentesque habitant morbi tristique senectus et. Purus non enim praesent elementum. Mauris cursus mattis molestie a iaculis at erat. In cursus turpis massa tincidunt. Augue mauris augue neque gravida in. Suspendisse ultrices gravida dictum fusce ut placerat orci nulla. Elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Tristique senectus et netus et. At ultrices mi tempus imperdiet nulla. Consectetur adipiscing elit ut aliquam purus sit amet.\n\nRisus in hendrerit gravida rutrum. Vitae et leo duis ut diam quam nulla porttitor. Aenean sed adipiscing diam donec adipiscing tristique risus nec feugiat. Quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. Aliquam sem fringilla ut morbi tincidunt augue interdum velit. Pellentesque elit ullamcorper dignissim cras tincidunt. Fermentum leo vel orci porta non pulvinar neque laoreet. Adipiscing tristique risus nec feugiat in fermentum posuere. Dictumst quisque sagittis purus sit amet volutpat consequat mauris nunc. Praesent semper feugiat nibh sed pulvinar proin gravida hendrerit. In eu mi bibendum neque egestas congue quisque egestas.',
  ),
  Post(
    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Stefan Frisk',
    body:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae sapien pellentesque habitant morbi tristique senectus et. Purus non enim praesent elementum. Mauris cursus mattis molestie a iaculis at erat. In cursus turpis massa tincidunt. Augue mauris augue neque gravida in. Suspendisse ultrices gravida dictum fusce ut placerat orci nulla. Elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Tristique senectus et netus et. At ultrices mi tempus imperdiet nulla. Consectetur adipiscing elit ut aliquam purus sit amet.\n\nRisus in hendrerit gravida rutrum. Vitae et leo duis ut diam quam nulla porttitor. Aenean sed adipiscing diam donec adipiscing tristique risus nec feugiat. Quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. Aliquam sem fringilla ut morbi tincidunt augue interdum velit. Pellentesque elit ullamcorper dignissim cras tincidunt. Fermentum leo vel orci porta non pulvinar neque laoreet. Adipiscing tristique risus nec feugiat in fermentum posuere. Dictumst quisque sagittis purus sit amet volutpat consequat mauris nunc. Praesent semper feugiat nibh sed pulvinar proin gravida hendrerit. In eu mi bibendum neque egestas congue quisque egestas.',
  ),
  Post(
    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    'Stefan Frisk',
    body:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vitae sapien pellentesque habitant morbi tristique senectus et. Purus non enim praesent elementum. Mauris cursus mattis molestie a iaculis at erat. In cursus turpis massa tincidunt. Augue mauris augue neque gravida in. Suspendisse ultrices gravida dictum fusce ut placerat orci nulla. Elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Tristique senectus et netus et. At ultrices mi tempus imperdiet nulla. Consectetur adipiscing elit ut aliquam purus sit amet.\n\nRisus in hendrerit gravida rutrum. Vitae et leo duis ut diam quam nulla porttitor. Aenean sed adipiscing diam donec adipiscing tristique risus nec feugiat. Quis eleifend quam adipiscing vitae proin sagittis nisl rhoncus. Aliquam sem fringilla ut morbi tincidunt augue interdum velit. Pellentesque elit ullamcorper dignissim cras tincidunt. Fermentum leo vel orci porta non pulvinar neque laoreet. Adipiscing tristique risus nec feugiat in fermentum posuere. Dictumst quisque sagittis purus sit amet volutpat consequat mauris nunc. Praesent semper feugiat nibh sed pulvinar proin gravida hendrerit. In eu mi bibendum neque egestas congue quisque egestas.',
  ),
];
