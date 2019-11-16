<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Sistema armazenamento de imagem</title>
</head>
<body>
<div align="center">
<h1>Sistema de Armazenamento de Imagens</h1>

<form:form method="POST" action="${pageContext.request.contextPath}/upload" modelAttribute="uploadForm" enctype="multipart/form-data">

    <strong>Selecione um arquivo:</strong> <input type="file" name="files" /><br/><br/>
    <input type="submit" value="Submit" />

</form:form>
<a href="${pageContext.request.contextPath}/home">IR PARA HOME</a>
</div>
</body>
</html>