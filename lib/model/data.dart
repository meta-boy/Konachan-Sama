// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

List<Data> dataFromJson(String str) => List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String dataToJson(List<Data> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Data {
    int id;
    String tags;
    int createdAt;
    int creatorId;
    String author;
    int change;
    String source;
    int score;
    String md5;
    int fileSize;
    String fileUrl;
    bool isShownInIndex;
    String previewUrl;
    int previewWidth;
    int previewHeight;
    int actualPreviewWidth;
    int actualPreviewHeight;
    String sampleUrl;
    int sampleWidth;
    int sampleHeight;
    int sampleFileSize;
    String jpegUrl;
    int jpegWidth;
    int jpegHeight;
    int jpegFileSize;
    String rating;
    bool hasChildren;
    dynamic parentId;
    String status;
    int width;
    int height;
    bool isHeld;
    String framesPendingString;
    List<dynamic> framesPending;
    String framesString;
    List<dynamic> frames;

    Data({
        this.id,
        this.tags,
        this.createdAt,
        this.creatorId,
        this.author,
        this.change,
        this.source,
        this.score,
        this.md5,
        this.fileSize,
        this.fileUrl,
        this.isShownInIndex,
        this.previewUrl,
        this.previewWidth,
        this.previewHeight,
        this.actualPreviewWidth,
        this.actualPreviewHeight,
        this.sampleUrl,
        this.sampleWidth,
        this.sampleHeight,
        this.sampleFileSize,
        this.jpegUrl,
        this.jpegWidth,
        this.jpegHeight,
        this.jpegFileSize,
        this.rating,
        this.hasChildren,
        this.parentId,
        this.status,
        this.width,
        this.height,
        this.isHeld,
        this.framesPendingString,
        this.framesPending,
        this.framesString,
        this.frames,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        tags: json["tags"],
        createdAt: json["created_at"],
        creatorId: json["creator_id"],
        author: json["author"],
        change: json["change"],
        source: json["source"],
        score: json["score"],
        md5: json["md5"],
        fileSize: json["file_size"],
        fileUrl: json["file_url"],
        isShownInIndex: json["is_shown_in_index"],
        previewUrl: json["preview_url"],
        previewWidth: json["preview_width"],
        previewHeight: json["preview_height"],
        actualPreviewWidth: json["actual_preview_width"],
        actualPreviewHeight: json["actual_preview_height"],
        sampleUrl: json["sample_url"],
        sampleWidth: json["sample_width"],
        sampleHeight: json["sample_height"],
        sampleFileSize: json["sample_file_size"],
        jpegUrl: json["jpeg_url"],
        jpegWidth: json["jpeg_width"],
        jpegHeight: json["jpeg_height"],
        jpegFileSize: json["jpeg_file_size"],
        rating: json["rating"],
        hasChildren: json["has_children"],
        parentId: json["parent_id"],
        status: json["status"],
        width: json["width"],
        height: json["height"],
        isHeld: json["is_held"],
        framesPendingString: json["frames_pending_string"],
        framesPending: List<dynamic>.from(json["frames_pending"].map((x) => x)),
        framesString: json["frames_string"],
        frames: List<dynamic>.from(json["frames"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tags": tags,
        "created_at": createdAt,
        "creator_id": creatorId,
        "author": author,
        "change": change,
        "source": source,
        "score": score,
        "md5": md5,
        "file_size": fileSize,
        "file_url": fileUrl,
        "is_shown_in_index": isShownInIndex,
        "preview_url": previewUrl,
        "preview_width": previewWidth,
        "preview_height": previewHeight,
        "actual_preview_width": actualPreviewWidth,
        "actual_preview_height": actualPreviewHeight,
        "sample_url": sampleUrl,
        "sample_width": sampleWidth,
        "sample_height": sampleHeight,
        "sample_file_size": sampleFileSize,
        "jpeg_url": jpegUrl,
        "jpeg_width": jpegWidth,
        "jpeg_height": jpegHeight,
        "jpeg_file_size": jpegFileSize,
        "rating": rating,
        "has_children": hasChildren,
        "parent_id": parentId,
        "status": status,
        "width": width,
        "height": height,
        "is_held": isHeld,
        "frames_pending_string": framesPendingString,
        "frames_pending": List<dynamic>.from(framesPending.map((x) => x)),
        "frames_string": framesString,
        "frames": List<dynamic>.from(frames.map((x) => x)),
    };
}
