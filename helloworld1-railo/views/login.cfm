<cfoutput>

	#myForm.start()#
	#myForm.displayErrors()#

	<table>
		<tr>
			<th>#myForm.label(name = "username", required = false)#</th>
			<td>#myForm.renderText(name = "username", size = 25)# (test)</td>
		</tr>
		<tr>
			<th>#myForm.label(name = "password", required = false)#</th>
			<td>#myForm.renderPassword(name = "password", size = 25)# (test)</td>
		</tr>
		<tr>
			<td colspan="2" class="center"><input type="submit" value="Log In" /></td>
		</tr>
	</table>
	#myForm.end()#

<script type="text/javascript">$("input:visible:enabled:first").focus();</script>
</cfoutput>