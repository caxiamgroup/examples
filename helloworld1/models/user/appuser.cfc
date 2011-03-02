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

	function setUser(User)
	{
		variables.user = arguments.user;
	}

	function getUser(user)
	{
		return variables.user;
	}

	function getUserId()
	{
		return variables.user.getUserId();
	}

	function getName()
	{
		return variables.user.getName();
	}

	function isSelf(userId)
	{
		return Compare(arguments.userId, variables.user.getuserId()) eq 0;
	}

}