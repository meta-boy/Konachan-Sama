// class Students{

//   final List<Student> data;

//   Students({this.data});

//   factory Students.fromJson(Map<String, dynamic> parsedJson){

//     var list = parsedJson['data'] as List;
//     print(list.runtimeType);
//     List<Student> studentList = list.map((i) => Student.fromJson(i)).toList();

//     return Students(
//       data: studentList

//     );
//   }
// }

// class Student {
//   final String roll;
//   final String name;
//   Student({this.roll, this.name});

//   factory Student.fromJson(Map<String, dynamic> parsedJson){
//    return Student(
//      roll:parsedJson['roll_no'],
//      name:parsedJson['first_name']
//    );
//   }
// }
/*{
  "id": 1547340,
  "name": "merii_(merysann)",
  "post_count": 1,
  "category": 1,
  "created_at": "2019-12-10T07:10:48.643-05:00",
  "updated_at": "2019-12-10T07:10:48.643-05:00",
  "is_locked": false
}
*/

class Tags {
  final List<Tag> data;
  Tags({this.data});
  factory Tags.fromJson(List<dynamic> parsedJson) {
    var list = parsedJson;
    List<Tag> tagList = list.map((i) => Tag.fromJson(i)).toList();
    return Tags(data: tagList);
  }
}

class Tag {
  final int id;
  final String name;
  final int category;
  final int postCount;
  final String createdAt;
  final String updatedAt;
  final bool isLocked;
  Tag(
      {this.category,
      this.postCount,
      this.createdAt,
      this.updatedAt,
      this.isLocked,
      this.name,
      this.id});

  factory Tag.fromJson(Map<String, dynamic> parsedJson) {
    return Tag(
        id: parsedJson["id"],
        name: parsedJson["name"],
        postCount: parsedJson["post_count"],
        category: parsedJson["category"],
        createdAt: parsedJson["created_at"],
        updatedAt: parsedJson["updated_at"],
        isLocked: parsedJson["is_locked"]);
  }
}

class Posts {
  final List<Post> data;
  Posts({this.data});
  factory Posts.fromJson(List<dynamic> parsedJson) {
    var list = parsedJson;
    List<Post> postList = list.map((i) => Post.fromJson(i)).toList();
    return Posts(data: postList);
  }
}

class Post {
  final int id;
  final String name;
  final String fileUrl;
  final String previewFileUrl;
  final List<String> tags;
  final int createdAt;
  final int updatedAt;
  Post(
      {this.fileUrl,
      this.previewFileUrl,
      this.createdAt,
      this.tags,
      this.updatedAt,
      this.name,
      this.id});

  factory Post.fromJson(Map<String, dynamic> parsedJson) {
    return Post(
        id: parsedJson["id"],
        name: parsedJson["name"],
        tags: parsedJson["tags"].split(" "),
        fileUrl: parsedJson["file_url"],
        previewFileUrl: parsedJson["preview_url"],
        createdAt: parsedJson["created_at"],
        updatedAt: parsedJson["updated_at"]);
  }
}

var hi = {
  "id": 295844,
  "tags":
      "ass birkai couch dress game_console mary_(pokemon) panties pokemon twintails underwear",
  "created_at": 1576003207,
  "creator_id": 181250,
  "author": "BattlequeenYume",
  "change": 1754984,
  "source": "https://www.pixiv.net/en/artworks/78233162",
  "score": 12,
  "md5": "d1967fbb79320fbd0e540d2f164fc830",
  "file_size": 4580369,
  "file_url":
      "https://konachan.com/image/d1967fbb79320fbd0e540d2f164fc830/Konachan.com%20-%20295844%20ass%20birkai%20couch%20dress%20game_console%20mary_%28pokemon%29%20panties%20pokemon%20twintails%20underwear.png",
  "is_shown_in_index": true,
  "preview_url":
      "https://konachan.com/data/preview/d1/96/d1967fbb79320fbd0e540d2f164fc830.jpg",
  "preview_width": 150,
  "preview_height": 106,
  "actual_preview_width": 300,
  "actual_preview_height": 212,
  "sample_url":
      "https://konachan.com/sample/d1967fbb79320fbd0e540d2f164fc830/Konachan.com%20-%20295844%20sample.jpg",
  "sample_width": 1500,
  "sample_height": 1061,
  "sample_file_size": 585304,
  "jpeg_url":
      "https://konachan.com/jpeg/d1967fbb79320fbd0e540d2f164fc830/Konachan.com%20-%20295844%20ass%20birkai%20couch%20dress%20game_console%20mary_%28pokemon%29%20panties%20pokemon%20twintails%20underwear.jpg",
  "jpeg_width": 3508,
  "jpeg_height": 2480,
  "jpeg_file_size": 861362,
  "rating": "q",
  "has_children": false,
  "parent_id": null,
  "status": "active",
  "width": 3508,
  "height": 2480,
  "is_held": false,
  "frames_pending_string": "",
  "frames_pending": [],
  "frames_string": "",
  "frames": []
};
