component
{

	function init()
	{
		setAuthenticated(false);
		return this;
	}

	function setAuthenticated(authenticated)
	{
		variables.authenticated = arguments.authenticated;
	}

	function isAuthenticated()
	{
		return variables.authenticated eq true;
	}

	/*
	You can't use set user due to ORM's persistence issues,
	SO you have to set the userID and on the get user, use the
	service to pull a persisted user object

	function setUser(User)
	{
		variables.user = arguments.user;
	}*/

	function getUser()
	{
		if(Len(variables.userId))
		{
			return Application.controller.getService("user").getUser(userId = variables.userId);
		}
		return Application.controller.getService("user").getUser();
	}

	function getUserId()
	{
		return variables.userId;
	}

	function setUserId(userId)
	{
		variables.userId = arguments.userId;
	}

	function getName()
	{
		return variables.user.getName();
	}

	function isSelf(userId)
	{
		return Compare(arguments.userId, variables.userId) eq 0;
	}

}