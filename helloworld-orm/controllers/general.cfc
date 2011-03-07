component extends="common"
{

	function index()
	{
		arguments.vc.name = request.sessionUser.getName();
	}

	function login()
	{
		local.form = getForm("login");

		local.form.addField(name = "username", label = "User Name", type = "string", required = true, maxLength = 50);
		local.form.addField(name = "password", label = "Password", type = "string", required = true, maxLength = 32);

		if (local.form.wasSubmitted())
		{
			local.form.validate();
			if (not local.form.hasErrors())
			{
				local.userService = getService("user");

				try
				{
					local.userService.loginUser(
						username = local.form.getFieldValue("username"),
						password = local.form.getFieldValue("password")
					);

					redirect("/index");
				}
				catch("LOGIN.BAD_USERNAME" error)
				{
					local.form.addError("Invalid username or password.");
				}
				catch("LOGIN.BAD_PASSWORD" error)
				{
					local.form.addError("Invalid username or password.");
				}
				catch(any error)
				{
					logException(error);
					local.form.addError("Unable to verify login information.");
				}
			}
		}

		local.form.setFieldValue("password", "");

		logout(redirect = false);

		arguments.vc.myForm = local.form;
	}

	function logout(redirect = true)
	{
		if (request.sessionUser.isAuthenticated())
		{
			request.sessionUser = getService("user").createAppUser();
		}

		request.sessionUser.setAuthenticated(false);

		getPlugin("session").clearAll();
		getPlugin("session").setVar("user", request.sessionUser);

		if (arguments.redirect)
		{
			application.controller.redirect("/login");
		}
	}

}