
var localGridObj;

var RockDataGridObj = function (params) {
    this.params = params;
    this.init();
}

RockDataGridObj.prototype = {
    //初始化工作
    init: function () {

        this.params.pageSize = this.params.pageSize || 25;
        this.params.enabledSort = this.params.enabledSort || false;
        this.params.rownumbers = this.params.rownumbers || true;
        this.params.height = this.params.height || '95%';
        this.params.width = this.params.width || '98%';
        this.params.fixedCellHeight = this.params.fixedCellHeight || false;
        if (this.params.toolbar == undefined) {
            this.params.toolbar =
            {
                items:
                        [
                            { text: '增加', img: '/Resources/js/ligerUI/lib/ligerUI/skins/icons/add.gif' }
                        ]
            };
        }

        if (this.params.defaultEdit != undefined) {
            var editColumn = { display: '编辑', render: this.generateEditColumn };
            this.params.columns.push(editColumn);
            this.bindDefaultEditEvent();
        }

        var ligerGrid = this.params.gridObj.ligerGrid(this.params);
        this.params.grid = ligerGrid;
    },
    generateEditColumn: function (rowdata, index, value) {
        var edithtml = '';
        var id = rowdata[localGridObj.params.pkName];
        switch (localGridObj.params.defaultEdit) {
            case true:
                edithtml = "<input type='button' value='编辑' data-Edit='true' data-ID='" + id + "'/><input type='button' value='删除' data-Del='true' data-ID='" + id + "'/>";
                break;
            case 'edit':
                edithtml = "<input type='button' value='编辑' data-Edit='true' data-ID='" + id + "'/>";
                break;
            case 'del':
                edithtml = "<input type='button' value='删除' data-Del='true' data-ID='" + id + "'/>";
                break;
            default:

        }
        return edithtml;
    },
    bindDefaultEditEvent: function () {
        if (this.params.defaultEdit || this.params.defaultEdit == 'edit') {
            var editUrl = this.params.editUrl;
            $("input[data-Edit='true']").live("click", function () {
                var id = $(this).attr('data-ID');
                $.ligerDialog.open({ height: 500, width: 800, url: editUrl + id });
            });
        }

        if (this.params.defaultEdit || this.params.defaultEdit == 'del') {
            var delUrl = this.params.delUrl;
            $("input[data-Del='true']").live("click", function () {
                var id = $(this).attr('data-ID');
                $.ligerDialog.confirm('确认要删除吗？', function (yes) {
                    if (yes) {
                        $.ajax({
                            type: "DELETE",
                            url: delUrl + id,
                            dataType: 'json',
                            success: function (data) {
                                if (data.Status == 'Success') {
                                    if (data.Msg != undefined) {
                                        $.ligerDialog.success(data.Msg)
                                    }
                                    else {
                                        $.ligerDialog.success('删除成功！');
                                    }
                                    localGridObj.params.grid.reload();
                                }
                                else {
                                    if (data.Msg != undefined) {
                                        $.ligerDialog.error(data.Msg)
                                    }
                                    else {
                                        $.ligerDialog.error('删除失败！')
                                    }
                                }
                            },
                            error: function () {
                                $.ligerDialog.error('删除失败，未知错误。')
                            }
                        });
                    }
                });
            });
        }
    },
    getSelectedPK: function () {
        var pks = [];
        var pkname = this.params.pkName;
        var selected = this.params.grid.getSelecteds();
        for (var i = 0; i < selected.length; i++) {
            pks.push(selected[i][pkname]);
        }
        return pks;
    }
};


$.fn.extend({

    RockDataGrid: function (params) {
        var gridObj = $(this);
        params.gridObj = gridObj;

        var dataGridObj = new RockDataGridObj(params);
        localGridObj = dataGridObj;
        return dataGridObj;
    }
});



