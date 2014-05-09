

var localFormObj;

var RockDataFormObj = function (params) {
    this.params = params;
    this.init();
}


RockDataFormObj.prototype = {
    setData: function () {
        var url = this.params.url;
        var formObj = this;

        $.ajax({
            type: "POST",
            url: url,
            dataType: 'json',
            success: function (data) {
                formObj.params.form.setData(data);
            }
        });
    },
    getData: function () {
        var data = this.params.form.getData();
        return liger.toJSON(data);
    },
    submit: function () {
        var data = localFormObj.params.form.getData();

        var url = localFormObj.params.url;
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            dataType: 'json',
            success: function (data) {
                if (localFormObj.params.success == undefined) {
                    alert('操作成功');
                }
                else {
                    localFormObj.params.success(data);
                }
            }
        });
    },
    init: function () {

        this.params.buttons = [{ text: '保存', width: 60, click: this.submit}];

        //创建表单结构 
        this.params.formObj.ligerForm(this.params);

        var id = this.params.formObj.attr("id");
        var form = liger.get(id);

        this.params.form = form;
        localParam = this.params;
    }
};


$.fn.extend({
    RockDataForm: function (params) {
        var formObj = $(this);
        var id = formObj.attr("id");
        params.formObj = formObj;
        var dataForm = new RockDataFormObj(params);

        localFormObj = dataForm;

        return dataForm;
    }
});