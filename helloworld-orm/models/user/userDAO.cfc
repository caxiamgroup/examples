<cfcomponent name="userDAO" extends="localModels.baseDAO" output="false">

	<cffunction name="executeReadHQL" access="public" output="false">
		<cfargument name="userId" default=""/>
		<cfargument name="username" default=""/>
		<cfargument name="password" default=""/>
		<cfargument name="name" default=""/>
		<cfargument name="orderBy" required="false"/>

		<cfset var data = ""/>
		<cfset local.queryOptions = {}>

		<cfif StructKeyExists(arguments, "maxResults") and Len(arguments.maxResults)>
			<cfset local.queryOptions.maxResults = arguments.maxResults>
		</cfif>

		<cfif StructKeyExists(arguments, "offset") and Len(arguments.offset)>
			<cfset local.queryOptions.offset = arguments.offset>
		</cfif>

		<cfquery name="data" dbtype="hql" ormoptions="#local.queryOptions#">
		<cfif StructKeyExists(arguments, "selectList") and Len(arguments.selectList)>
			SELECT     #arguments.selectList#
		</cfif>
			FROM       user
			WHERE      1 = 1
		<cfif Len(arguments.userId)>
			AND        userId = <cfqueryparam value="#arguments.userId#" CFSQLType="cf_sql_char"/>
		</cfif>
		<cfif Len(arguments.username)>
			AND        username = <cfqueryparam value="#arguments.username#" CFSQLType="cf_sql_varchar"/>
		</cfif>
		<cfif Len(arguments.password)>
			AND        password = <cfqueryparam value="#arguments.password#" CFSQLType="cf_sql_varchar"/>
		</cfif>
		<cfif Len(arguments.name)>
			AND        name = <cfqueryparam value="#arguments.name#" CFSQLType="cf_sql_varchar"/>
		</cfif>
		<cfif StructKeyExists(arguments, "orderBy") and Len(arguments.orderBy)>
			ORDER BY   #arguments.orderBy#
		</cfif>
		</cfquery>

		<cfreturn data/>
	</cffunction>

</cfcomponent>
