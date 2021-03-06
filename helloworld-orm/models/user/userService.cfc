component name="userService" extends="localModels.baseService" output="false"
{
	public function init()
	{
		variables.dao = new userDAO("user", "user");
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

	public function deleteUser(required bean)
	{
		delete(argumentCollection = arguments);
	}

	public function getUsersCount()
	{
		arguments.selectList = " COUNT(*) ";
		arguments.offset = "";
		arguments.maxResults = "";
		return variables.dao.executeReadHQL(argumentCollection = arguments)[1];
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
