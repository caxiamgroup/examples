component name="userService" extends="models.baseService"
{
	public function init()
	{
		variables.dao = new userDAO();
		super.init(argumentCollection = arguments);
		return this;
	}

	public function getUser()
	{
		return read(argumentCollection = arguments);
	}

	public function getUsers()
	{
		return queryToArray(variables.dao.read(argumentCollection = arguments));
	}

	public function saveUser(required bean, forceInsert = false)
	{
		if (! Len(arguments.bean.getUserId()) || arguments.forceInsert)
		{
			variables.dao.insert(arguments.bean);
		}
		else
		{
			variables.dao.update(arguments.bean);
		}
	}

	public function deleteUser()
	{
		delete(argumentCollection = arguments);
	}

	package function create()
	{
		return new user();
	}

	public function createAppUser()
	{
		return CreateObject("component", "appuser").init(argumentCollection = arguments);
	}

	public void function loginUser(required username, required password)
	{
		local.user = read(username = arguments.username);

		if (! Len(local.user.getUserId()))
		{
			throw(type = "LOGIN.BAD_USERNAME");
		}

		local.password = hashPassword(
			userId = local.user.getUserId(),
			password = arguments.password
		);

		if (local.password != local.user.getPassword())
		{
			throw(type = "LOGIN.BAD_PASSWORD");
		}

		local.appUser = createAppUser();
		local.appUser.setAuthenticated(true);
		local.appUser.setUser(local.user);

		application.controller.getPlugin("session").setVar("user", local.appUser);
	}

	public function hashPassword(userId, password)
	{
		return Hash(arguments.userId & arguments.password, "SHA");
	}

}
