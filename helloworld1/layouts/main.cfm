<cfoutput>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Hello World 1</title>

	<link href="/ax_lib/css/common.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/media/css/site.css" rel="stylesheet" type="text/css" media="all" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.js" type="text/javascript"></script>
	<script src="/ax_lib/js/validation.js" type="text/javascript"></script>
	<script src="/media/js/site.js" type="text/javascript"></script>
</head>
<body>

<div class="header">
</div>

#body#

<div class="footer">
</div>

#application.controller.getPlugin("forms").getClientSideValidationScript()#
</body>
</html>
</cfoutput>