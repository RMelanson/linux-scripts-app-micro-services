<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<div id="CI_Div" class="page_Div">
	<h1>WELCOME TO CLOUD INITIALISER</h1>

	<input type="checkbox" id="applications" onclick="checkBoxDivToggle(this)">Applications<BR>
		<div id="applications_Div" class="checkBoxes">
				<!-- <script> $("#applications_Div").load("./pages/cloudInit/apps.jsp"); </script> -->
				document.getElementById("applications_Div").innerHTML='<object type="text/html" data="./pages/cloudInit.jsp" ></object>';
		</div>
	
	<input type="checkbox" id="dev" onclick="checkBoxDivToggle(this)">Development<BR>
		<div id="dev_Div" class="checkBoxes">
				<!-- <script> $("#dev_Div").load("./pages/cloudInit/dev.jsp"); </script> -->
				document.getElementById("dev_Div").innerHTML='<object type="text/html" data="./pages/cloudInit.jsp" ></object>';
		</div>

	<input type="checkbox" id="devOps" onclick="checkBoxDivToggle(this)">DevOps<BR>
		<div id="devOps_Div" class="checkBoxes">
				<!-- <script> $("#devOps_Div").load("./pages/cloudInit/devOps.jsp"); </script> -->
				document.getElementById("devOps_Div").innerHTML='<object type="text/html" data="./pages/cloudInit.jsp" ></object>';
		</div>

	<input type="checkbox" id="utilities" onclick="checkBoxDivToggle(this)">Utilities<BR>
		<div id="utilities_Div" class="checkBoxes">
				<!-- <script> $("#utilities_Div").load("./pages/cloudInit/utils.jsp"); </script> -->
				document.getElementById("utilities_Div").innerHTML='<object type="text/html" data="./pages/cloudInit.jsp" ></object>';
		</div>
</div>

    <div id="admin_Div" class="page_Div">
	    <script> $("#oracle_Div").load("./pages/cloudInit/devOps/admin/linuxAdmin/jsp"); </script>
    </div>

	<div id="docker_Div" class="page_Div">
	    <script> $("#docker_Div").load("./pages/cloudInit/devOps/docker.jsp"); </script>
	</div>

	<div id="git_Div" class="page_Div">
		<script> $("#git_Div").load("./pages/cloudInit/devOps/git.jsp"); </script>
	</div>

	<div id="http_Div" class="page_Div">
		<script> $("#http_Div").load("./pages/cloudInit/apps/web/servers/http.jsp"); </script>
    </div>

	<div id="java_Div" class="page_Div">
		<script> $("#java_Div").load("./pages/cloudInit/dev/lang/java.jsp"); </script>
	</div>
	
	<div id="jenkins_Div" class="page_Div">
	    <script> $("#jenkins_Div").load("./pages/cloudInit/devOps/jenkins.jsp"); </script>
	</div>

	<div id="jBoss_Div" class="page_Div">
		<script> $("#jBoss_Div").load("./pages/cloudInit/apps/web/servers/jBoss.jsp"); </script>
    </div>

	<div id="jenkins_Div" class="page_Div">
		<script> $("#jenkins_Div").load("./pages/cloudInit/devOps/apps/jenkins.jsp"); </script>
	</div>
	
    <div id="linuxAdmin_Div" class="page_Div">
	    <script> $("#linuxAdmin_Div").load("./pages/cloudInit/devOps/admin/linuxAdmin.jsp"); </script>
	</div>

	<div id="mysql_Div" class="page_Div">
		<script> $("#mysql_Div").load("./pages/cloudInit/dev/db/mysql.jsp"); </script>
	</div>
		
	<div id="nodeJS_Div" class="page_Div">
		<script> $("#nodeJS_Div").load("./pages/cloudInit/dev/lang/nodeJS.jsp"); </script>
	</div>

	<div id="oracle_Div" class="page_Div">
			<script> $("#oracle_Div").load("./pages/cloudInit/dev/db/oracle.jsp"); </script>
	</div>

	<div id="perl_Div" class="page_Div">
		<script> $("#perl_Div").load("./pages/cloudInit/dev/lang/perl.jsp"); </script>
	</div>

	<div id="s3fs_Div" class="page_Div">
		<script> $("#s3fs_Div").load("./pages/cloudInit/devOps/storage/s3sf.jsp"); </script>
	</div>

	<div id="tools_Div" class="page_Div">
			<script> $("#tools_Div").load("./pages/cloudInit/dev/tools.jsp"); </script>
	</div>

	<div id="adminServices_Div" class="page_Div">
	    <script> $("#adminServices_Div").load("./pages/cloudInit/devOps/admin/adminServices.jsp"); </script>
	</div>
	
	<div id="userAdmin_Div" class="page_Div">
	    <script> $("#userAdmin_Div").load("./pages/cloudInit/devOps/admin/userAdmin.jsp"); </script>
	</div>
	
	<div id="wp_Div" class="page_Div">
		<script> $("#wp_Div").load("./pages/cloudInit/apps/web/blogs/wp.jsp"); </script>
	</div>
	<div id="utils_Div" class="page_Div">
		<script> $("#utils_Div").load("./pages/cloudInit/utils/utils.jsp"); </script>
	</div>
