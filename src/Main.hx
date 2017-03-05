/**
    Type doc
**/
typedef MyType = {
    /**
        Field doc
    **/
    var name:String;
}

class Main {
    static function main() {
        var schema = JsonSchemaGenerator.generate(MyType);
        sys.io.File.saveContent("schema.json", haxe.Json.stringify(schema, "  "));
    }
}
