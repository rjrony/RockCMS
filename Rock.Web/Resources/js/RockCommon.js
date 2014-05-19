Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1, //month 
        "d+": this.getDate(), //day 
        "h+": this.getHours(), //hour 
        "m+": this.getMinutes(), //minute 
        "s+": this.getSeconds(), //second 
        "q+": Math.floor((this.getMonth() + 3) / 3), //quarter 
        "S": this.getMilliseconds() //millisecond 
    }

    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }

    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
};


$.extend(
{
    //将unix时间格式转成ISO普通时间格式
    getDateFromUnix: function (unixtime) {
        var unixTimestamp = new Date(unixtime * 1000).format("yyyy-MM-dd hh:mm:ss");
        //        commonTime = unixTimestamp.toLocaleDateString();
        commonTime = unixTimestamp;
        return commonTime;
    },
    getUnixDate: function (str) {
        date = str.replace(/-/g, "/");
        var date = new Date(str);
        var humanDate = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds()));
        alert(humanDate.getTime() / 1000 - 8 * 60 * 60);     
    }
}
);