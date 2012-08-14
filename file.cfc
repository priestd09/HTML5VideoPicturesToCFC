<cfcomponent>

	<cffunction name="updateProduct" access="remote" returntype="string" returnformat="plain">
		<cfargument name="file">
		
			<cfset var imgFile = "">
			<cfset var image = "">
			
		<cfif structKeyExists(arguments, "file") AND len(arguments.file)>	
			<!--- trim off this helper data that toBinary does not like --->
			<cfset contents = replace(file, "data:image/jpeg;base64,","")>
			<cfset b = toBinary(contents)>
			<cfset fileName = createUUID()>
			
			<cffile action="write" file="#expandpath("images")#/#fileName#.jpg" output="#b#" addnewline="No">
		</cfif>
		
		<cfset JSON = '{"picture":"#fileName#.jpg"}'>
		
		<cfreturn JSON>
	</cffunction>
	
</cfcomponent>