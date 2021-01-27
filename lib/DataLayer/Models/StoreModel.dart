// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

import 'dart:convert';

List<StoreModel> storeModelFromJson(String str) => List<StoreModel>.from(json.decode(str).map((x) => StoreModel.fromJson(x)));

String storeModelToJson(List<StoreModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreModel {
    StoreModel({
        this.id,
        this.count,
        this.description,
        this.link,
        this.name,
        this.slug,
        this.taxonomy,
        this.parent,
        this.meta,
        this.yoastHead,
        this.image,
        this.links,
    });

    int id;
    int count;
    String description;
    String link;
    String name;
    String slug;
    Taxonomy taxonomy;
    int parent;
    List<dynamic> meta;
    String yoastHead;
    String image;
    Links links;

    factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json["id"],
        count: json["count"],
        description: json["description"],
        link: json["link"],
        name: json["name"],
        slug: json["slug"],
        taxonomy: taxonomyValues.map[json["taxonomy"]],
        parent: json["parent"],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        yoastHead: json["yoast_head"],
        image: json["image"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "description": description,
        "link": link,
        "name": name,
        "slug": slug,
        "taxonomy": taxonomyValues.reverse[taxonomy],
        "parent": parent,
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "yoast_head": yoastHead,
        "image": image,
        "_links": links.toJson(),
    };
}

class Links {
    Links({
        this.self,
        this.collection,
        this.about,
        this.wpPostType,
        this.curies,
    });

    List<About> self;
    List<About> collection;
    List<About> about;
    List<About> wpPostType;
    List<Cury> curies;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        wpPostType: List<About>.from(json["wp:post_type"].map((x) => About.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "wp:post_type": List<dynamic>.from(wpPostType.map((x) => x.toJson())),
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

class Cury {
    Cury({
        this.name,
        this.href,
        this.templated,
    });

    Name name;
    Href href;
    bool templated;

    factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: nameValues.map[json["name"]],
        href: hrefValues.map[json["href"]],
        templated: json["templated"],
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "href": hrefValues.reverse[href],
        "templated": templated,
    };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = EnumValues({
    "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum Name { WP }

final nameValues = EnumValues({
    "wp": Name.WP
});

enum Taxonomy { COUPON_STORE }

final taxonomyValues = EnumValues({
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
