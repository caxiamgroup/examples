component accessors="true"
{
	property name="userId" type="string";
	property name="username" type="string";
	property name="password" type="string";
	property name="name" type="string";

	/* in the cfc generator it creates 2 seperate files, _user and user.
	This is so we have a file that is not edited (the _user) and the editable file
	to create relationships and other extra (non-database) related fields.
	*/

}
