component
{
	this.name = Hash(GetCurrentTemplatePath());
	this.datasource = "alyx_sandbox";

	include "../../alyx/core/framework.cfc";

	function setupApplication()
	{
		application.notLoggedInPages = {
			"general.login" = "",
			"general.logout" = "",
			"general.forgot-password" = ""
		};
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

	function getErrorEmailRecipients()
	{
		return "jim@caxiamgroup.com";
	}
}