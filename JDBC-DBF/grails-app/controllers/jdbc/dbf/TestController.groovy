package jdbc.dbf

import java.sql.*
import groovy.sql.Sql
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class TestController {

    def index() { 
		render (view:"accueil")
	}
	
	//TODO: Faire de la connection un singloton et ne pas la recréer à chaque requete
	//TODO: Stocker le nom des tables/colonnes dans des variables au cas ou ils changent et initialiser leurs valeurs avec des fichiers de conf
	
	def showCAForm(){
		render(view:"showCAForm")
	}
	
	def display_CA() {
		
		//Verification du format de la date rentree par l'utilisateur
		def dateParser = new java.text.SimpleDateFormat("dd.MM.yyy")
		dateParser.lenient = false
		try {
			dateParser.parse(params.beginning_date)
		}
		catch(java.text.ParseException e){
			redirect(action:"showCAForm")
			return
		}
		
		String beginning_date = params.beginning_date
		String end_date = params.end_date
		def sql = Sql.newInstance(ConfigurationHolder.config.dataSource.url) //TODO: Trouver une syntaxe non depreciee
		def result = sql.rows("SELECT SORT,SUM(GSUM) AS sum FROM \"UMSATZ.DBF\" WHERE DATUM >= to_date($beginning_date,'dd.MM.yyyy') AND DATUM <= to_date($end_date,'dd.MM.yyyy') GROUP BY SORT ORDER BY sum DESC")
		render (view:"display_CA", model:[result:result, beginning_date:beginning_date, end_date:end_date])
		sql.close()
	}
}
