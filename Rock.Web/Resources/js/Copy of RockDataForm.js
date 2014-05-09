

var fieldTemplate = "<div class='control-group'><label class='control-label'><%=data.display%></label><div class='controls'><%=data.field%></div></div>";

var RockDataFormObj = function (params) {
    this.params = params;
}


RockDataFormObj.prototype = {

    generateFields: function () {
        if (this.params.fields == undefined) {
            return;
        }

        var rockDataFormObj = this;
        $.each(this.params.fields, function (index, item) {

            if (item.size == undefined) {
                item.size = "small";
            }

            var field;
            switch (item.type) {
                case "date":
                    {
                        field = $("<input\>").attr({ type: "text", name: item.name, id: item.name });
                    }
                    break;
                case "text":
                    field = $("<input\>").attr({ type: "text", name: item.name, placeholder: item.placeholder, class: "m-wrap " + item.size + "" });
                    break;
                case "textarea":
                    field = $("<textarea\>").attr({ name: item.name, rows: 3, class: "m-wrap  " + item.size + "" })
                    break;
                case "select":
                    {
                        field = $("<select\>").attr({ name: item.name, class: "m-wrap  " + item.size + "" });
                        $.each(item.options, function (index, option) {
                            var val = option.value == undefined ? option.text : option.value;
                            field.append("<option value='" + val + "'>" + option.text + "</option>");
                        });
                    }
                    break;
                default:
                    break;
            }

            var fieldHtml = _.template(fieldTemplate, { display: item.display, field: field.prop("outerHTML") }, { variable: 'data' });
            rockDataFormObj.params.form.append(fieldHtml);
            if (item.type = "date") {
                $("#" + item.name + "").ligerDateEditor({ showTime: true, height: 50 });
            }
        });
    }

};


$.fn.extend({
    RockDataForm: function (params) {
        var formObj = $(this);
        params.form = formObj;
        var dataForm = new RockDataFormObj(params);

        dataForm.generateFields();
    }
});