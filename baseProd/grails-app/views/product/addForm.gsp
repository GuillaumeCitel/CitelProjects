<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="layout" content="main">
<title>Add Product Form</title>
</head>
<header>
	<g:include view='shared_templates/commonHeader.gsp'/>
</header>
<body>
<p>
	<g:form name="AddProd" action="addToDatabase">
	<p>
		<label for="productRef">Product Reference* :</label>
		<input type="text" name="productRef" id="productRef"/>
		<br/>
	
		<label for="status">Status* :</label>
		<input type="text" name="status" id="status"/>
		<br/>
	
		<input type="submit" value="Add"/>
		</p>
	</g:form>
</p>
</body>
</html>