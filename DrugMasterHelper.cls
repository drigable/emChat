public class DrugMasterHelper {

    public static String ListtoString(String texttemplate) {
	    if (texttemplate.startsWith('[') && texttemplate.endsWith(']')) {
   	    	texttemplate = texttemplate.substring(1, texttemplate.length() - 1);
        }
        // Split the string into an array of values
        List<String> texttemplateList = texttemplate.split(',');
        String newTextTemplate = '( ';
        for (Integer i = 0; i < texttemplateList.size(); i++) {
            newTextTemplate = newTextTemplate + ' \'' +texttemplateList[i] + '\',' ;
        }
		system.debug('after for newStrengthList: ' +newTextTemplate);
        if (newTextTemplate.endsWith(',')) {
		    system.debug('in if newStrengthList: ' +newTextTemplate);
            newTextTemplate = newTextTemplate.substring(0, newTextTemplate.length() - 1);
            newTextTemplate = newTextTemplate + ')';
		    system.debug('last newTextTemplate: ' +newTextTemplate);

		    return newTextTemplate;
		} else {
		    return '\'' +texttemplate+'\'';
		}
    }

    @InvocableMethod (label = 'ValueToGroupByNew' description = 'returns drug collection')
	public static List<List<SObject>> ValueToGroupByNew(List<ValuesToGroupBy> requestList) {
        String FieldName = requestList[0].FieldName;
        String ObjectApiName = requestList[0].ObjectAPIName;
        String withApi = requestList[0].withApi;
        String APIName = requestList[0].APIName;
        String RegionName = requestList[0].RegionName;
        String CountryList = requestList[0].CountryList;
        String DrugNameList = requestList[0].DrugNameList;
        String StrengthList = requestList[0].StrengthList;
        String CompanyList = requestList[0].CompanyList;
        String PackagingList = requestList[0].PackagingList;
        String PharmaFormList = requestList[0].PharmaFormList;
        String withOtherfields = requestList[0].withOtherfields;
        String searchTerm = requestList[0].searchTerm;
        Integer rowLimit = requestList[0].rowLimit;
        Integer rowOffset = requestList[0].rowOffset;
        if (withApi == 'false') {
            String query = 'SELECT ' + FieldName + ' name FROM ' + ObjectApiName;
            if (String.isNotBlank(searchTerm)) {
                query += ' WHERE ' + FieldName + ' LIKE \'%' + searchTerm + '%\'';
            }
            query += ' GROUP BY ' + FieldName;
            query += ' ORDER BY ' + FieldName + ' ASC LIMIT :rowLimit OFFSET :rowOffset';
    	    System.debug('query : ' + query);
            List<List<SObject>> finalList = new List<List<SObject>>();
            try {
    		    List<SObject> results = Database.query(query);
                finalList.add(results);

                return finalList;
			} catch (Exception e) {
    	    System.debug('Error executing query: ' + e.getMessage());
                return finalList;
		    }
        }

		if (APIName != null && withOtherfields == 'true') {
            String query = 'SELECT ' + 'strength__c,genericname__c,brandname__c,country__c,region__c,company__c,packaging__c,Pharmaceutical_Form__c,NATIONALDRUGID__c,INTERNATIONALDRUGID__c,NUMBEROFUNITS__c  ' + ' FROM ' + ObjectApiName  +' where ';
			System.debug('query : ' + query);
            if (APIName != null) {
                query = query + ' genericname__c = \'' + APIName +  '\'';
                System.debug('api not null : ' + query);
            }

            if (RegionName != null && RegionName != 'Worldwide') {
                query = query + ' and ' + ' (region__c = \'' + RegionName +  '\'' + 'or region_davinci__c= \'' + RegionName + '\'' +') ';
                System.debug('region not null : ' + query);
            }
            if (StrengthList != null) {
                String newStrengthList = ListtoString(StrengthList);
                // query = query + ' and ' + 'Strength__c in' + ' ' + newStrengthList + ' group by ' + fieldname;
                query = query + ' and ' + 'Strength__c in' + ' ' + newStrengthList;
                System.debug('strengthquery : ' + query);
            }
            if (DrugNameList != null && String.isBlank(DrugNameList) == false && String.isEmpty(DrugNameList) == false ) {
                String newDrugNameList = ListtoString(DrugNameList);
 				query = query + ' and ' + 'brandname__c in' + ' ' + newDrugNameList;
		        System.debug('druglist : ' + query);
            }
            if (PharmaFormList != null) {
                String newPharmaFormList = ListtoString(PharmaFormList);
 				query = query + ' and ' + 'Pharmaceutical_Form__c in' + ' ' + newPharmaFormList;
                System.debug('pharmalist : ' + query);
            }
            if (CountryList != null && String.isBlank(CountryList) == false && String.isEmpty(CountryList) == false) {
                String newCountryList = ListtoString(CountryList);
 				query = query + ' and ' + 'Country__c in' + ' ' + newCountryList;
                System.debug('countrylist : ' + query);
            }
            if (CompanyList != null && String.isBlank(CompanyList) == false && String.isEmpty(CompanyList) == false) {
                String newCompanyList = ListtoString(CompanyList);
 				query = query + ' and ' + 'Company__c in' + ' ' + newCompanyList;
                System.debug('complist : ' + query);
            }
            if (PackagingList != null) {
                String newPackagingList = ListtoString(PackagingList);
 				query = query + ' and ' + 'Packaging__c in' + ' ' + newPackagingList;
                System.debug('packaginglist : ' + query);
            }

            System.debug('last query: ' + query);

            List<List<SObject>> finalList = new List<List<SObject>>();
            try {
    		    List<SObject> results = Database.query(query);
                finalList.add(results);

                return finalList;
			} catch (Exception e) {
    	        System.debug('Error executing query: ' + e.getMessage());

                return finalList;
		    }
        } else {
            // String query = 'SELECT ' + FieldName + ' FROM ' + ObjectApiName + ' GROUP BY ' + FieldName;
            String query =  'SELECT ' + FieldName + ' name FROM ' + ObjectApiName  +' where ';
    	    System.debug('query : ' + query);
            if (APIName !=null) {
                query = query + ' genericname__c = \'' + APIName +  '\'';
                system.debug('api not null : ' + query);
            }
            if (RegionName != null && RegionName != 'Worldwide') {
                query = query + ' and ' + ' (region__c = \'' + RegionName +  '\'' + 'or region_davinci__c= \'' +RegionName +'\'' +') ';
				System.debug('region not null : ' + query);
            }
            if (StrengthList != null) {
			String newStrengthList = ListtoString(StrengthList);

            // query = query + ' and ' + 'Strength__c in' + ' ' + newStrengthList + ' group by ' + fieldname;
            query = query + ' and ' + 'Strength__c in' + ' ' + newStrengthList;
                system.debug('strengthquery : ' + query);
            }
            if (DrugNameList != null && String.isBlank(DrugNameList) == false && String.isEmpty(DrugNameList) == false) {
                String newDrugNameList = ListtoString(DrugNameList);
 				query = query + ' and ' + 'brandname__c in' + ' ' + newDrugNameList;
		        System.debug('druglist : ' + query);
            }
            if (PharmaFormList != null) {
                String newPharmaFormList = ListtoString(PharmaFormList);
 				query = query + ' and ' + 'Pharmaceutical_Form__c in' + ' ' + newPharmaFormList;
                System.debug('pharmalist : ' + query);

            }
            if (CountryList != null && String.isBlank(CountryList) == false && String.isEmpty(CountryList) == false) {
                String newCountryList = ListtoString(CountryList);
 				query = query + ' and ' + 'Country__c in' + ' ' + newCountryList;
                System.debug('countrylist : ' + query);
            }
            if (CompanyList != null && String.isBlank(CompanyList) == false && String.isEmpty(CompanyList) == false) {
                String newCompanyList = ListtoString(CompanyList);
 				query = query + ' and ' + 'Company__c in' + ' ' + newCompanyList;
                System.debug('complist : ' + query);
            }
            if (PackagingList != null) {
                String newPackagingList = ListtoString(PackagingList);
 				query = query + ' and ' + 'Packaging__c in' + ' ' + newPackagingList;
                System.debug('packaginglist : ' + query);
            }
            if (String.isNotBlank(searchTerm)) {
                query += ' AND ' + FieldName + ' LIKE \'%' + searchTerm + '%\'';
            }
			query = query + ' group by ' + fieldname;
            query += ' ORDER BY ' + FieldName + ' ASC LIMIT :rowLimit OFFSET :rowOffset';
            System.debug('last query: ' + query);

            List<List<SObject>> finalList = new List<List<SObject>>();
            try {
    		    List<SObject> results = Database.query(query);
                finalList.add(results);

         		return finalList;
			} catch (Exception e) {
    	        System.debug('Error executing query: ' + e.getMessage());
                return finalList;
		    }
        }
    }

    public class ValuesToGroupBy{
        @InvocableVariable(required=true)
        public String FieldName;
		@InvocableVariable(required=true)
        public String ObjectAPIName;
        @InvocableVariable(required=true)
        public String withApi;
        @InvocableVariable(required=false)
        public String APIName;
        @InvocableVariable(required=false)
        public String RegionName;
		@InvocableVariable(required=false)
        public String CountryList;
		@InvocableVariable(required=false)
        public String DrugNameList;
        @InvocableVariable(required=false)
        public String StrengthList;
        @InvocableVariable(required=false)
        public String CompanyList;
        @InvocableVariable(required=false)
        public String PackagingList;
        @InvocableVariable(required=false)
        public String PharmaFormList;
        @InvocableVariable(required=true)
        public String withOtherfields;
        public String searchTerm;
        public Integer rowLimit;
        public Integer rowOffset;
    }

}