<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="layout" content="main">
<title>Show All Product</title>
</head>
<header>
	<g:include view='shared_templates/commonHeader.gsp'/>
</header>
<body>
	<p>
		Voici tous les produits dans la database:
	</p>
	<p>
		Reference --- Status <!--TODO: Mettre ca dans un joli tableau... -->
		<g:each in="${listAllProduct}" var="product">
			<li>${product.productRef } --- ${product.status }  
			<g:link controller="Product" action="showProductDetails" params="[productID: "${product.id}"]">Voir</g:link>
			<g:link controller="Product" action="showModifForm" params="[productID: "${product.id}"]">Modifier</g:link>
			<g:link controller="Product" action="showRelatedDoc" params="[productID: "${product.id}"]">Gerer docs associes</g:link>
			<g:link controller="Product" action="delete" params="[productID: "${product.id}"]">Supprimer</g:link>
		</g:each>
	</p>
	<p>
		<g:link controller="Product" action="showAddForm">Ajouter un nouveau produit</g:link>
	</p>
</body>
</html>