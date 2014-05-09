

var dataGridList = [];

var RockDataGridObj = function (params) {
    this.params = params;
    //post到server的自定义参数
    this.params.serverParams = null;
    this.templateTxt = $("#dataGridTemp").html();
    this.loadingLayer = $("<div/>").attr("id", "liyu").attr("style", "background-color: black; width: 90px;height: 70px;opacity: 0.6;text-align: center;position: absolute;top: 50%;left: 50%;").css("display", "none");
    this.loadingLayer.html("<p style='color: white;margin-top: 7px;font-size: 17px;'>加载中...</p><img src='/Resources/image/fancybox_loading.gif'/>")
}

RockDataGridObj.prototype = {
    //初始化工作
    init: function () {

        if (this.params.dataRootName == null
        || this.params.dataRootName == "") {
            this.params.dataRootName = "Data";
        }
        if (this.params.PageTotalCount == null
        || this.params.PageTotalCount == "") {
            this.params.PageTotalCount = "PageTotalCount";
        }
        if (this.params.recordParmName == null
        || this.params.recordParmName == "") {
            this.params.recordParmName = "TotalCount";
        }
        if (this.params.pageParmName == null
        || this.params.pageParmName == "") {
            this.params.pageParmName = "pageindex";
        }
        if (this.params.pageSizeParmName == null
        || this.params.pageSizeParmName == "") {
            this.params.pageSizeParmName = "pagesize";
        }

        var params = this.params;
        var propertyObj = this;

        $("body").append(this.loadingLayer);

        //分页事件
        $(".pagination li").live("click", function () {
            var obj = $(this);
            var currentPage = params.currentPage;
            var pageCount = params.pageCount;
            var page = 0;

            if (obj.hasClass("prev")) {
                if (currentPage == 1) {
                    return;
                }
                page = currentPage - 1;
            }
            else if (obj.hasClass("next")) {
                if (currentPage == pageCount) {
                    return;
                }
                page = currentPage + 1;
            }
            else {
                var clickPage = parseInt(obj.find("a").text().trim());
                if (currentPage == clickPage) {
                    return;
                }
                page = clickPage;
            }
            propertyObj.showLoadingLayer();
            $(".pagination li").not(obj).removeClass("active");
            obj.addClass("active");
            params.currentPage = page;
            propertyObj.changePage();
        });
    },
    showLoadingLayer: function () {
        this.loadingLayer.css("display", "block");
    },
    hideLoadingLayer: function () {
        this.loadingLayer.css("display", "none");
    },
    //渲染datagird
    generateDataGrid: function () {
        var html = _.template(this.templateTxt, this.params, { variable: 'data' });
        var obj = $(html).attr("data-GridID", this.params.currentDomID);
        var gridObj = $("table[data-GridID='" + this.params.currentDomID + "']");

        if (gridObj == undefined || gridObj.length == 0) {
            this.params.currentDom.after(obj);
        }
        else {
            gridObj.next().remove();
            gridObj.replaceWith(obj);
        }
    },
    //获取数据
    getDataFromServer: function () {
        var serverUrl = this.params.url;
        var pageIndex = this.params.currentPage;
        var pageSize = this.params.pageSize;
        var pageParmName = this.params.pageParmName;
        var pageSizeName = this.params.pageSizeParmName;

        var serverParams = "" + pageParmName + "=" + pageIndex + "&" + pageSizeName + "=" + pageSize + "";
        if (this.params.serverParams != undefined) {
            serverParams += "&" + $.param(this.params.serverParams);
        }

        var gridObj = this;
        $.ajax({
            type: "POST",
            url: serverUrl,
            dataType: "json",
            data: serverParams,
            success: function (jsonData) {
                gridObj.params.serverData = jsonData[gridObj.params.dataRootName];
                gridObj.params.recordCount = jsonData[gridObj.params.recordParmName];
                gridObj.params.pageCount = jsonData[gridObj.params.PageTotalCount];
                gridObj.generateDataGrid();
                gridObj.hideLoadingLayer();
            },
            error: function () {
                gridObj.hideLoadingLayer();
            }
        });
    },
    //翻页事件
    changePage: function (pageIndex) {
        if (pageIndex != undefined) {
            this.params.currentPage = pageIndex;
        }
        this.getDataFromServer();
    },
    //设置post给server的自定义参数
    setServerParams: function (params) {
        this.params.serverParams = params;
    },
    getDataGridObj: function () {
        return this;
    }
};


$.fn.extend({

    RockDataGrid: function (params) {
        var checkBox = params.checkBox;
        var columns = params.columns;
        var pageSize = params.pageSize;
        var url = params.url;

        params.currentPage = 1;
        var currentDom = $(this);
        var id = currentDom.attr("id");
        currentDom.css("display", "none");
        params.currentDom = currentDom;
        params.currentDomID = id;

        var dataGridObj = new RockDataGridObj(params);
        dataGridObj.init();
        dataGridObj.getDataFromServer();

        var grid = { "ID": id, "Obj": dataGridObj };
        dataGridList.push(grid);

        return dataGridObj;
    }
});



