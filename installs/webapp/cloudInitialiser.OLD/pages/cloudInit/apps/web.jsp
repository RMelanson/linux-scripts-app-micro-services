<input type="checkbox" id="blogs" onclick="checkBoxDivToggle(this)">Blogs<BR>
<div id="blogs_Div" class="checkBoxes">
		blogsDiv
	<script>
		$("#blogs_Div").load("./pages/cloudInit/apps/web/blogs.jsp");
	</script>
</div>

<input type="checkbox" id="servers" onclick="checkBoxDivToggle(this)">Servers<BR>
<div id="servers_Div" class="checkBoxes">
		serversDiv
	<script>
		$("#servers_Div").load("./pages/cloudInit/apps/web/servers.jsp");
	</script>
</div>
