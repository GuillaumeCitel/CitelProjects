package baseProd

import java.util.Date;

class ProductCarac {

	String code //X3
	int price //X3
	String family //X3
	String range
	Date dateCreated
	
	//static belongsTo = [describedProduct:Product]
	
    static constraints = {
    }
}
