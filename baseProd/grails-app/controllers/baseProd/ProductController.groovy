package baseProd

import baseProd.Product;

class ProductController {

	//static scaffold = Product // TODO:Se renseigner sur ca
	
    def index() { 
	}
	
	def showAddForm (){
		render view:"addForm" //TODO: Il y'a surement une meilleure maniere que creer une fonction seulement pour afficher une vue
	}
	
	def addToDatabase (String productRef, String status){
		Product entry = new Product(productRef:productRef, status:status)
		entry.save(flush:true)
		redirect(action:"showAll")
	}
	
	def showAll () {
		def myList = Product.list()
		render (view:"showAll", model: [listAllProduct: myList])
	}
	
	def showProductDetails () {
		def Product chosenProduct = Product.get(params.productID)
		render (view:"productDetails", model: [product: chosenProduct])
	}
	
	def showModifForm() {
		def Product chosenProduct = Product.get(params.productID)
		render (view:"modifForm", model:[product: chosenProduct])
	}
	
	def modif() {
		def Product p = Product.get(params.productID)
		p.productRef=params.productRef
		p.status = params.status
		p.save()
		redirect(action:"showAll")
	}
	
	def delete() {
		def Product p = Product.get(params.productID)
		p.delete()
		redirect(action:"showAll")
	}
	
	def showRelatedDoc() {
		def Product chosenProduct = Product.get(params.productID)
		render (view:"relatedDocs", model:[product: chosenProduct])
	}
}
