<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="layout" content="main">
<title>Product Details</title>
</head>
<header>
</header>
<body>
	<p>
		<g:include view="/shared_templates/productAttributes.gsp" model="[product:product]"/>
	</p>
	<p>
		<g:link controller="Product" action="showAll">Retour</g:link>
		<g:link controller="Product" action="showModifForm" params="[productID: "${product.id}"]">Modifier</g:link>
		<g:link controller="Product" action="delete" params="[productID: "${product.id}"]">Supprimer</g:link>
	</p>
</body>
</html>