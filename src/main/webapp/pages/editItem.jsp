<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--<c:set var="picPath" value="http://127.0.0.1:8003/ssmImage19"></c:set>--%>
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
        #content_bot h1{
            text-align: center;
        }
        #content_bot h1{
            padding-bottom: 20px;
        }
        table tr{
            padding: 10px 0px;

        }
    </style>
</head>
<body>
<div id="content">
    <div id="content_bot">
        <h1 style=" background-color: #CCF7CD;">更新电子文档</h1>
        <form action="${ctx}/entry/saveOrUpdate" method="post">
            <table width="100%" border=1>
                <tr>
                    <td>文档编号</td><td><input type="text" name="id" value="${edocEntry.id}"/></td>
                </tr>
                <tr>
                    <td>文档名称(*)</td><td><input type="text" name="title" value="${edocEntry.title}"/></td>
                </tr>
                <tr>
                    <td>文档摘要</td>
                    <td><textarea name="summary" >${edocEntry.summary}</textarea></td>
                </tr>
                <tr>
                    <td>上传人</td><td><input type="text" name="uploadUser" value="${edocEntry.uploadUser}"/></td>
                </tr>
                <tr>
                    <td>上传时间(*)</td><td><input type="text" name="createDate" value="<fmt:formatDate value="${edocEntry.createDate}" pattern="yyyy-MM-dd"/>"/></td>
                </tr>
                <tr style="text-align: center">
                    <td colspan="2">
                        <input value="提交"  type="button" id="submitBut">
                        <input value="返回" type="button" id="backBut">
                    </td>
                </tr>
            </table>
            <input type="hidden" value="${edocEntry.categoryId}" name="categoryId">
        </form>
    </div>
</div>
</body>
<script src="${ctx}/static/js/jquery.js"></script>
<script type="text/javascript">
    $("#backBut").click(function () {
        window.location='${ctx}/entry/entryAll';
    });

    $("#submitBut").click(function () {
        $('form').submit();
    });
</script>
</html>