<cfcomponent name="userDAO" extends="models.baseDAO" output="false">

	<cffunction name="init" output="false">
		<cfreturn this/>
	</cffunction>

	<cffunction name="read" output="no">
		<cfquery name="local.data">
			SELECT     *
			FROM       user
			WHERE      1 = 1
		<cfif StructKeyExists(arguments, "userId")>
			AND        userId = <cfqueryparam value="#arguments.userId#" CFSQLType="cf_sql_char"/>
		</cfif>
		<cfif StructKeyExists(arguments, "username")>
			AND        username = <cfqueryparam value="#arguments.username#" CFSQLType="cf_sql_varchar"/>
		</cfif>
		<cfif StructKeyExists(arguments, "password")>
			AND        password = <cfqueryparam value="#arguments.password#" CFSQLType="cf_sql_varchar"/>
		</cfif>
		<cfif StructKeyExists(arguments, "name")>
			AND        name = <cfqueryparam value="#arguments.name#" CFSQLType="cf_sql_varchar" null="#not Len(arguments.name)#"/>
		</cfif>
		<cfif StructKeyExists(arguments, "orderBy") and Len(arguments.orderBy)>
			ORDER BY   #arguments.orderBy#
		</cfif>
		</cfquery>

		<cfreturn local.data/>
	</cffunction>

	<cffunction name="insert" access="public" output="false">
		<cfargument name="bean"/>

		<cfif not Len(arguments.bean.getUserId())>
			<cfset arguments.bean.setUserId(CreateUuid())/>
		</cfif>

		<cfquery>
			INSERT INTO user
			(
				userId,
				username,
				password,
				name
			)
			VALUES
			(
				<cfqueryparam value="#arguments.bean.getUserId()#" CFSQLType="cf_sql_char"/>,
				<cfqueryparam value="#arguments.bean.getUsername()#" CFSQLType="cf_sql_varchar"/>,
				<cfqueryparam value="#arguments.bean.getPassword()#" CFSQLType="cf_sql_varchar"/>,
				<cfqueryparam value="#arguments.bean.getName()#" CFSQLType="cf_sql_varchar" null="#not Len(arguments.bean.getName())#"/>
			)
		</cfquery>
	</cffunction>

	<cffunction name="update" output="false">
		<cfargument name="bean"/>

		<cfquery>
			UPDATE     user
			SET        username = <cfqueryparam value="#arguments.bean.getUsername()#" CFSQLType="cf_sql_varchar"/>,
			           password = <cfqueryparam value="#arguments.bean.getPassword()#" CFSQLType="cf_sql_varchar"/>,
			           name = <cfqueryparam value="#arguments.bean.getName()#" CFSQLType="cf_sql_varchar" null="#not Len(arguments.bean.getName())#"/>
			WHERE      userId = <cfqueryparam value="#arguments.bean.getUserId()#" CFSQLType="cf_sql_char"/>
		</cfquery>
	</cffunction>

	<cffunction name="delete" output="no">
		<cfargument name="bean"/>

		<cfquery>
			DELETE
			FROM       user
			WHERE      userId = <cfqueryparam value="#arguments.bean.getUserId()#" CFSQLType="cf_sql_char"/>
		</cfquery>
	</cffunction>

</cfcomponent>
