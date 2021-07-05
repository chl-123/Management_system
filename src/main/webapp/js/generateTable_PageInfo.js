// 执行分页，生成页面效果，任何时候调用这个函数都会重新加载页面
function generatePage() {
    // 1.获取分页数据
    var url=window.url;
    var pageInfo = getPageInfoRemote(url);

    // 2.填充表格
    var fn=showUser_listTable(pageInfo);
    fillTableBody(pageInfo,fn);

}

