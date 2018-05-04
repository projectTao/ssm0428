<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查询商品列表</title>
    <style type="text/css">
        *{
            padding: 0px;
            margin: 0px auto;
        }
        #content{
            width: 960px;
            margin-top: 50px;
            border: 2px solid #000000;
        }
        #content_bot h1,#content_top{
            text-align: center;
        }
        #content_top{

            padding: 20px 0px 20px 0px;
        }
        #content_bot h1{
            padding-bottom: 20px;
        }
        /* 各行变色效果实现方案 */
        table tr:nth-child(odd) {
            background-color: #FFF;
        }
        table tr:nth-child(even) {
            background-color: #CCF7CD;
        }
    </style>
</head>
<body>
<div id="content">
    <input type="hidden" value="${Category}" id="inputHid">
    <div id="content_top">
            文档分类：<select name="category">

                        <option value="">全部</option>
                        <c:if test="${not empty Category }">
                            <option value="1" <c:if test="${Category == 1 }">selected="selected"</c:if> >java类</option>
                            <option value="2" <c:if test="${Category == 2 }">selected="selected"</c:if>>mysql类</option>
                        </c:if>
                    </select>
            <button id="selectBut" style="margin-left: 15px">查询</button>
            <button id="addWord" style="margin-left: 200px">新增电子文档</button>
    </div>
    <div id="content_bot">
        <h1>电子文档列表</h1>
        <form action="${ctx}/entry/entryAll" method="post" id="entryAllId">
            <table width="100%" border=1>
                <tr style="background-color: #808080;font-weight: bolder" id="categoryId">
                    <td>文档编号</td>
                    <td>文档名称</td>
                    <td>文档摘要</td>
                    <td>上传人</td>
                    <td>上传时间</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${entry }" var="entry" varStatus="vs">
                    <tr id="categoryIdByEntry">
                        <td id="disableSum">${entry.id }</td>
                        <td>${entry.title }</td>
                        <td>${entry.summary }</td>
                        <td>${entry.uploadUser }</td>
                        <td><fmt:formatDate value="${entry.createDate}" pattern="yyyy-MM-dd"/></td>
                        <td><a href="${ctx}/entry/entryEdit/${entry.id }">修改</a>&nbsp;&nbsp;&nbsp;
                            <a href="${ctx}/entry/deleteById/${entry.id }?category=0" id="delBut">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${not empty  msg }">
                    <tr style="text-align: center;color: red"><td colspan="6">${msg}</td></tr>
                </c:if>
            </table>
        </form>
    </div>
</div>
</body>
<script type="text/javascript" src="${ctx}/static/js/jquery.js"></script>
<script type="text/javascript">
    $(function () {
        var disableSum =$("#disableSum").val();
        if (disableSum === undefined){
            $("#entryAllId").submit();
        }
    })
</script>
<script type="text/javascript">
    var eCategory = $("select[name=category]");
    var categoryId = $("#inputHid").val();
    if(categoryId ===""){
        $.ajax({
            url:'${ctx}/category/categoryAll',
            type:'post',
            contentType: 'application/json;charset=UTF-8',
            dataType: 'json',
            success:function (data) {
                var category = data;
                var html = '<option value="">全部</option>';
                for (var i = 0; i < category.length; i++) {
                    html += '<option value=' + category[i].id + '>' + category[i].name + '</option>'
                }
                $(eCategory).empty();
                $(eCategory).html(html);
            }
        })
    }

    $("#selectBut").click(function () {
        var categoryId = $("select[name=category]").val();
        //选择全部的时候提交表单获取全部数据，不为空的时候去单个查询分类。
        if (categoryId === ''){
            $("#entryAllId").submit();
        }else{
            $("#categoryIdByEntry").nextAll().remove();
            $.ajax({
                url:'${ctx}/entry/categoryIdByEntry/' + categoryId,
                type:'post',
                contentType: 'application/json;charset=UTF-8',
                dataType: 'json',
                success:function (data) {
                    var entry = data;
                    var html = "";
                    for(var i = 0; i < entry.length; i++){
                        html+=' <tr id="categoryIdByEntry">' +
                            '                        <td>'+entry[i].id+'</td>' +
                            '                        <td>'+entry[i].title+'</td>' +
                            '                        <td>'+entry[i].summary+'</td>' +
                            '                        <td>'+entry[i].uploadUser+'</td>' +
                            '                        <td>'+entry[i].createDate+'</td>' +
                            '                        <td><a href="${ctx}/entry/entryEdit/'+entry[i].id+'">修改</a>&nbsp;&nbsp;&nbsp;<a href="${ctx}/entry/deleteById/' + entry[i].id + '"  id="delMsg">删除</a></td>'
                            +'</tr>';
                    }
                    $("#categoryIdByEntry").remove();
                    $("#categoryId").after(html);
                }
            })
        }
    })
    $("#addWord").click(function () {
        window.location = '${ctx}/pages/addItemsList.jsp';
    })
</script>
</html>