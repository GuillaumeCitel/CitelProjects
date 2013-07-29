package baseProd

import java.util.Date;

class Product {
	
	static searchable = true
	
	String productRef //X3
	String status
	//Date dateCreated
	
	static hasMany = [documents:Document]

	//ProductCarac productCarac
	
    static constraints = {
    }
}
