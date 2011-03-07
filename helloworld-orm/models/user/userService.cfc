component name="userService" extends="localModels.baseService"
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
		return variables.dao.read(argumentCollection = arguments);
	}

	public function saveUser(required bean, forceInsert = false)
	{
		if(!Len(Arguments.bean.getUserId()))
		{
			Arguments.bean.setUserId(CreateUUID());
		}

		save(bean, forceInsert);
	}

	public function deleteUser()
	{
		delete(argumentCollection = arguments);
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
		local.appUser.setUserId(local.user.getUserId());

		application.controller.getPlugin("session").setVar("user", local.appUser);
	}

	public function hashPassword(userId, password)
	{
		return Hash(arguments.userId & arguments.password, "SHA");
	}

}
