#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
using haxe.macro.Tools;
#end

class JsonSchemaGenerator {
    public static macro function generate(type) {
        var schema = genSchema(Context.getType(type.toString()), type.pos);
        return macro $v{schema};
    }

    #if macro
    static function genSchema(type:Type, pos:Position):JsonSchema {
        switch (type.follow()) {
            case TInst(_.get() => cl, params):
                switch [cl, params] {
                    case [{pack: [], name: "String"}, []]:
                        return {type: "string"};
                    case [{pack: [], name: "Array"}, [elemType]]:
                        return {
                            type: "array",
                            items: genSchema(elemType, pos)
                        };
                    default:
                }

            case TAbstract(_.get() => ab, params):
                switch [ab, params] {
                    case [{pack: [], name: "Int"}, []]:
                        return {type: "integer"};
                    case [{pack: [], name: "Float"}, []]:
                        return {type: "number"};
                    case [{pack: [], name: "Bool"}, []]:
                        return {type: "boolean"};
                    default:
                }

            case TAnonymous(_.get() => anon):
                var props = new haxe.DynamicAccess();
                var required = [];

                // sort by declaration position
                anon.fields.sort(function(a, b) return a.pos.getInfos().min - b.pos.getInfos().min);

                for (i in 0...anon.fields.length) {
                    var f = anon.fields[i];
                    var schema = genSchema(f.type, f.pos);
                    schema.propertyOrder = i;
                    props[f.name] = schema;
                    if (!f.meta.has(":optional"))
                        required.push(f.name);
                }
                var schema:JsonSchema = {
                    type: "object",
                    properties: props,
                    additionalProperties: false,
                }
                if (required.length > 0)
                    schema.required = required;
                return schema;

            default:
        }
        throw new Error("Cannot generate Json schema for type " + type.toString(), pos);
    }
    #end
}
