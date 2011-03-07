component mappedSuperClass="true" output="false"
{
	property name="userId" fieldtype="id" generator="assigned";
	property name="username";
	property name="password";
	property name="name";

	public function init()
	{
		return this;
	}

}
