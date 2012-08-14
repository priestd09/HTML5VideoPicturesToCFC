<cfcomponent>

	<cffunction name="updateProduct" access="remote" returntype="string" returnformat="plain">
		<cfargument name="file">
		
			<cfset var imgFile = "">

		
		<cfif structKeyExists(arguments, "file") AND len(arguments.file)>
			<cffile action="upload" filefield="file" nameconflict="makeunique" destination="#expandpath("images")#">
			<cfset imgFile = CFFILE.ServerFile>
		</cfif>
		
		<cfset JSON = '{"picture":"#imgFile#"}'>
		
		<cfreturn JSON>
	</cffunction>
	
</cfcomponent>