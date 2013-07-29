<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="layout" content="main">
<title>Add Doc Form</title>
</head>
<header>
</header>
<body>
	<p>
		Produit --> Reference: ${product.productRef } --- Status: ${product.status }<br/>
	</p>
	<g:form name="AddDoc" action="addToDatabase" method="post" enctype="multipart/form-data" params="[productID: "${product.id}"]">
	<p>
		<label for="docRef">Reference* :</label>
		<input type="text" name="docRef" id="docRef"/>
		<br/>
		
		<label for="docType">Type* :</label>
		<input type="text" name="docType" id="docType"/>
		<br/>
		
		<label for="status">Status* :</label>
		<input type="text" name="status" id="status"/>
		<br/>
		
		<label for="file">File :</label>  
		<input type="file" name="file" id="file"/>
		<br/> 

		<input type="submit" value="Add"/>
	</p>
	</g:form>
</body>
</html>