<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="myDate" class="java.util.Date"/>
<jsp:useBean id="sutil" class="com.gridfs.app.controller.SizeUtil"/>

<html>
<head>
<title>Sistema armazenamento de imagem</title>
<style>
table {
        color: #333;
        font-family: Helvetica, Arial, sans-serif;
        width: 1000px;
        border-collapse: collapse;
        border-spacing: 0;
}

td,th {
        border: 1px solid #CCC;
        height: 30px;
}

th {
        background: #F3F3F3;
        font-weight: bold;
}

td {
        background: #FAFAFA;
        text-align: center;
}
</style>
</head>
<body>
	<div align="center">
		<h1>Sistema de Armazenamento de Imagens</h1>
		<form method="POST" action="${pageContext.request.contextPath}/search" modelAttribute="search">
		  <input type="text" name="name" placeholder="Procura pelo nome do arquivo" style="width: 300px;" autofocus/> <button type="submit">Buscar</button>
		</form>
		<br/>
		<table>
			 <tr>
			  <th>Doc Id</th>
			  <th>Nome</th>
			  <th>Tipo</th>
			  <th>Tamanho</th>
			  <th>Última modificação</th>
			  <th>Ação</th>
			 </tr>
			 <c:forEach var="gsv" items="${gs}">
              
              <tr>
			  <td><c:out value="${gsv.getId()}" /></td>
			  <td><c:out value="${gsv.getFilename()}" /></td>
			  <td><c:out value="${gsv.getContentType()}" /></td>
			  <td><c:out value="${sutil.formatFileSize(gsv.contentLength())}"/></td>
			  
			  
			  <c:set target="${myDate}" property="time" value="${gsv.lastModified()}"/>
			  <td><fmt:formatDate value="${myDate }" pattern="dd/MM/yyyy HH:mm:ss" /></td>
			  
			  <td><a href="${pageContext.request.contextPath}/delete/${gsv.getId()}">Deletar</a> | <a href="${pageContext.request.contextPath}/visualization/${gsv.getId()}" target="blank">Visualizar</a></td>
			 </tr>
             </c:forEach>
		</table>
		<br/>
		
		<a href="${pageContext.request.contextPath}/upload"><strong>Upload Novo Documento</strong></a>
	</div>
</body>
</html>