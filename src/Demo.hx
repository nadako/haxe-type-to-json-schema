typedef MapItemDef = {
    name:String,
    buyable:Bool,
    ?goldMultiplier:Float,
    baseCapacity:Int,
    levels:Array<{upgradeCost:Int, bonusCapacity:Int}>,
}

class Demo {
    @:expose("getSchema")
    static function getSchema() {
        return JsonSchemaGenerator.generate(MapItemDef);
    }
}
