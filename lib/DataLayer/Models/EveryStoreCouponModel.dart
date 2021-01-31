// To parse this JSON data, do
//
//     final everyStoreCouponModel = everyStoreCouponModelFromJson(jsonString);

import 'dart:convert';

List<EveryStoreCouponModel> everyStoreCouponModelFromJson(String str) => List<EveryStoreCouponModel>.from(json.decode(str).map((x) => EveryStoreCouponModel.fromJson(x)));

String everyStoreCouponModelToJson(List<EveryStoreCouponModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EveryStoreCouponModel {
    EveryStoreCouponModel({
        this.id,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.type,
        this.link,
        this.title,
        this.content,
        this.excerpt,
        this.author,
        this.featuredMedia,
        this.menuOrder,
        this.commentStatus,
        this.pingStatus,
        this.template,
        this.meta,
        this.couponCategory,
        this.store,
        this.betterFeaturedImage,
        this.wpcCouponTypeCode,
        this.wpcDestinationUrl,
        this.yoastHead,
        this.links,
    });

    int id;
    DateTime date;
    DateTime dateGmt;
    Guid guid;
    DateTime modified;
    DateTime modifiedGmt;
    String slug;
    String status;
    String type;
    String link;
    Guid title;
    Content content;
    Content excerpt;
    int author;
    int featuredMedia;
    int menuOrder;
    String commentStatus;
    String pingStatus;
    String template;
    List<dynamic> meta;
    List<int> couponCategory;
    List<int> store;
    BetterFeaturedImage betterFeaturedImage;
    String wpcCouponTypeCode;
    String wpcDestinationUrl;
    String yoastHead;
    Links links;

    factory EveryStoreCouponModel.fromJson(Map<String, dynamic> json) => EveryStoreCouponModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        menuOrder: json["menu_order"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        template: json["template"],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        couponCategory: List<int>.from(json["coupon-category"].map((x) => x)),
        store: List<int>.from(json["store"].map((x) => x)),
        betterFeaturedImage: BetterFeaturedImage.fromJson(json["better_featured_image"]),
        wpcCouponTypeCode: json["_wpc_coupon_type_code"],
        wpcDestinationUrl: json["_wpc_destination_url"],
        yoastHead: json["yoast_head"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "menu_order": menuOrder,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "template": template,
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "coupon-category": List<dynamic>.from(couponCategory.map((x) => x)),
        "store": List<dynamic>.from(store.map((x) => x)),
        "better_featured_image": betterFeaturedImage.toJson(),
        "_wpc_coupon_type_code": wpcCouponTypeCode,
        "_wpc_destination_url": wpcDestinationUrl,
        "yoast_head": yoastHead,
        "_links": links.toJson(),
    };
}

class BetterFeaturedImage {
    BetterFeaturedImage({
        this.id,
        this.altText,
        this.caption,
        this.description,
        this.mediaType,
        this.mediaDetails,
        this.post,
        this.sourceUrl,
    });

    int id;
    String altText;
    String caption;
    String description;
    String mediaType;
    MediaDetails mediaDetails;
    int post;
    String sourceUrl;

    factory BetterFeaturedImage.fromJson(Map<String, dynamic> json) => BetterFeaturedImage(
        id: json["id"],
        altText: json["alt_text"],
        caption: json["caption"],
        description: json["description"],
        mediaType: json["media_type"],
        mediaDetails: MediaDetails.fromJson(json["media_details"]),
        post: json["post"],
        sourceUrl: json["source_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "alt_text": altText,
        "caption": caption,
        "description": description,
        "media_type": mediaType,
        "media_details": mediaDetails.toJson(),
        "post": post,
        "source_url": sourceUrl,
    };
}

class MediaDetails {
    MediaDetails({
        this.width,
        this.height,
        this.file,
        this.sizes,
        this.imageMeta,
    });

    int width;
    int height;
    String file;
    Sizes sizes;
    ImageMeta imageMeta;

    factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
        width: json["width"],
        height: json["height"],
        file: json["file"],
        sizes: Sizes.fromJson(json["sizes"]),
        imageMeta: ImageMeta.fromJson(json["image_meta"]),
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "sizes": sizes.toJson(),
        "image_meta": imageMeta.toJson(),
    };
}

class ImageMeta {
    ImageMeta({
        this.aperture,
        this.credit,
        this.camera,
        this.caption,
        this.createdTimestamp,
        this.copyright,
        this.focalLength,
        this.iso,
        this.shutterSpeed,
        this.title,
        this.orientation,
        this.keywords,
    });

    String aperture;
    String credit;
    String camera;
    String caption;
    String createdTimestamp;
    String copyright;
    String focalLength;
    String iso;
    String shutterSpeed;
    String title;
    String orientation;
    List<dynamic> keywords;

    factory ImageMeta.fromJson(Map<String, dynamic> json) => ImageMeta(
        aperture: json["aperture"],
        credit: json["credit"],
        camera: json["camera"],
        caption: json["caption"],
        createdTimestamp: json["created_timestamp"],
        copyright: json["copyright"],
        focalLength: json["focal_length"],
        iso: json["iso"],
        shutterSpeed: json["shutter_speed"],
        title: json["title"],
        orientation: json["orientation"],
        keywords: List<dynamic>.from(json["keywords"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "aperture": aperture,
        "credit": credit,
        "camera": camera,
        "caption": caption,
        "created_timestamp": createdTimestamp,
        "copyright": copyright,
        "focal_length": focalLength,
        "iso": iso,
        "shutter_speed": shutterSpeed,
        "title": title,
        "orientation": orientation,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
    };
}

class Sizes {
    Sizes({
        this.thumbnail,
        this.wpcouponSmallThumb,
    });

    Thumbnail thumbnail;
    Thumbnail wpcouponSmallThumb;

    factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        wpcouponSmallThumb: Thumbnail.fromJson(json["wpcoupon_small_thumb"]),
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
        "wpcoupon_small_thumb": wpcouponSmallThumb.toJson(),
    };
}

class Thumbnail {
    Thumbnail({
        this.file,
        this.width,
        this.height,
        this.mimeType,
        this.sourceUrl,
    });

    String file;
    int width;
    int height;
    MimeType mimeType;
    String sourceUrl;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        file: json["file"],
        width: json["width"],
        height: json["height"],
        mimeType: mimeTypeValues.map[json["mime-type"]],
        sourceUrl: json["source_url"],
    );

    Map<String, dynamic> toJson() => {
        "file": file,
        "width": width,
        "height": height,
        "mime-type": mimeTypeValues.reverse[mimeType],
        "source_url": sourceUrl,
    };
}

enum MimeType { IMAGE_JPEG }

final mimeTypeValues = EnumValues({
    "image/jpeg": MimeType.IMAGE_JPEG
});

class Content {
    Content({
        this.rendered,
        this.protected,
    });

    String rendered;
    bool protected;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
    };
}

class Guid {
    Guid({
        this.rendered,
    });

    String rendered;

    factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
    };
}

class Links {
    Links({
        this.self,
        this.collection,
        this.about,
        this.author,
        this.replies,
        this.wpFeaturedmedia,
        this.wpAttachment,
        this.wpTerm,
        this.curies,
    });

    List<About> self;
    List<About> collection;
    List<About> about;
    List<Author> author;
    List<Author> replies;
    List<Author> wpFeaturedmedia;
    List<About> wpAttachment;
    List<WpTerm> wpTerm;
    List<Cury> curies;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        wpFeaturedmedia: List<Author>.from(json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm: List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "wp:featuredmedia": List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
    };
}

class About {
    About({
        this.href,
    });

    String href;

    factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Author {
    Author({
        this.embeddable,
        this.href,
    });

    bool embeddable;
    String href;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
    };
}

class Cury {
    Cury({
        this.name,
        this.href,
        this.templated,
    });

    String name;
    String href;
    bool templated;

    factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
    };
}

class WpTerm {
    WpTerm({
        this.taxonomy,
        this.embeddable,
        this.href,
    });

    Taxonomy taxonomy;
    bool embeddable;
    String href;

    factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: taxonomyValues.map[json["taxonomy"]],
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "taxonomy": taxonomyValues.reverse[taxonomy],
        "embeddable": embeddable,
        "href": href,
    };
}

enum Taxonomy { COUPON_CATEGORY, COUPON_STORE }

final taxonomyValues = EnumValues({
    "coupon_category": Taxonomy.COUPON_CATEGORY,
    "coupon_store": Taxonomy.COUPON_STORE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
