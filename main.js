(function ($hx_exports) { "use strict";
var JsonSchemaGenerator = function() { };
var Main = function() { };
Main.getSchema = $hx_exports.getSchema = function() {
	return { required : ["name","buyable","baseCapacity","levels"], additionalProperties : false, properties : { baseCapacity : { propertyOrder : 3, type : "integer"}, levels : { propertyOrder : 4, type : "array", items : { required : ["upgradeCost","bonusCapacity"], additionalProperties : false, properties : { upgradeCost : { propertyOrder : 0, type : "integer"}, bonusCapacity : { propertyOrder : 1, type : "integer"}}, type : "object"}}, buyable : { propertyOrder : 1, type : "boolean"}, goldMultiplier : { propertyOrder : 2, type : "number"}, name : { propertyOrder : 0, type : "string"}}, type : "object"};
};
})(typeof window != "undefined" ? window : exports);
