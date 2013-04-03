<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.apollo89.mybatis_sample.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
ItemDao dao = new ItemDao();
ArrayList<HashMap<String, String>> list = null;  

String itemid = request.getParameter("itemid");

if(itemid == null || "".equals(itemid)){
	//error
} else {
	HashMap<String,String> map = new HashMap<String,String>();
	map.put("itemid",itemid);
	list = dao.getItem2(map);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mybatis_sample</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
function golist() {
	$(location).attr('href','index.jsp');
}
</script>
</head>
<body>
<div>
   <table border="1">
      <colgroup>
        <col width="20%">
        <col width="40%">
        <col width="20%">
        <col width="20%">
      </colgroup>
      
      <thead>
        <tr> 
           <th>colume</th><th>value</th>
        </tr>
      </thead>
      
      <tbody>
         <!-- jstl을 이용하여 list에 담겨있는 Map의 value값을 호출  -->
         <c:forEach var="list" items="<%=list%>">
            <tr>
              <td>itemid</td>
              <td>${list.itemid}</td>
            </tr>
            <tr>
              <td>productid</td>
              <td>${list.productid}</td>
            </tr>
            <tr>
              <td>listprice</td>
              <td>${list.listprice}</td>
            </tr>
            <tr>
              <td>attr1</td>
              <td>${list.attr1}</td>
            </tr>
            <tr>
              <td>status</td>
              <td>${list.status}</td>
            </tr>
            <tr>
              <td>supplier</td>
              <td>${list.supplier}</td>
            </tr>
		 </c:forEach>
      </tbody>
   </table>
 </div>
<div>
<input type="button" id="golist" name="목록으로" value="목록으로" onclick="golist()" >
</div>

</body>
</html>