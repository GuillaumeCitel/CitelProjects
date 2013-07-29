<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="layout" content="main">
<title>Product Modif</title>
</head>
<header>
</header>
<body>
<p>
	<g:form name="ModifProd" action="modif" params="[productID: "${product.id}"]">
	<p>
		<label for="productRef">Product Reference* :</label>
		<input type="text" name="productRef" id="productRef" value="${product.productRef }"/>
		<br/>
	
		<label for="status">Status* :</label>
		<input type="text" name="status" id="status" value="${product.status }"/>
		<br/>
		
		<g:link controller="Product" action="showProductDetails" params="[productID: "${product.id}"]">Retour</g:link>
		<input type="submit" value="Enregistrer"/>
		</p>
	</g:form>
</p>
</body>
</html>