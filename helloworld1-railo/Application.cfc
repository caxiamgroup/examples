component extends="caxiam.alyx.core.framework"
{
	this.name = Hash(GetCurrentTemplatePath());
	this.datasource = "alyx_sandbox";

	function setupApplication()
	{
		application.notLoggedInPages = {
			"general.login" = "",
			"general.logout" = "",
			"general.forgot-password" = ""
		};

		application.controller.initModule("facts");
	}

	function setupSession()
	{
		application.controller.getPlugin("session").setVar("user", CreateObject("component", "models.user.appuser").init());
	}

	function setupRequest()
	{
		request.sessionUser = application.controller.getPlugin("session").getVar("user");

		if (! request.sessionUser.isAuthenticated())
		{
			if (! StructKeyExists(application.notLoggedInPages, request.action))
			{
				redirect("/login");
			}
		}
	}

	function isDevEnvironment()
	{
		return true;
	}

	function getErrorEmailRecipientsXXX()
	{
		return "jim@caxiamgroup.com";
	}
}