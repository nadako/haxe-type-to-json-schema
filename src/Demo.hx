typedef MapItemDef = {
    name:String,
    buyable:BuyableType,
    ?goldMultiplier:Float,
    baseCapacity:Int,
    levels:Array<{upgradeCost:Int, bonusCapacity:Int}>,
}

@:enum abstract BuyableType(String) {
    var Buyable = "Buyable";
    var NonBuyable = "NonBuyable";
    var TradeOnly = "TraceOnly";
}

class Demo {
    @:expose("getSchema")
    static function getSchema() {
        return JsonSchemaGenerator.generate("MapItemDef", "");
    }
}
