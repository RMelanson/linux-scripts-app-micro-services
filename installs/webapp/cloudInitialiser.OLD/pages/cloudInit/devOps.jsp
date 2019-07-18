<input type="checkbox" id="docker" onclick="checkBoxMenuToggle(this)">Docker<BR>
<input type="checkbox" id="git" onclick="checkBoxMenuToggle(this)">Git<BR>   
<input type="checkbox" id="jenkins" onclick="checkBoxMenuToggle(this)">Jenkins<BR>
<input type="checkbox" id="linuxAdmin" onclick="checkBoxDivToggle(this)">Linux Admin<BR>
	<div id="linuxAdmin_Div" class="checkBoxes">
	    <script> $("#linuxAdmin_Div").load("./pages/cloudInit/devOps/linuxAdmin.jsp"); </script>
	</div>
<input type="checkbox" id="storage" onclick="checkBoxDivToggle(this)">Storage<BR>
    <div id="storage_Div" class="checkBoxes">
        <script> $("#storage_Div").load("./pages/cloudInit/devOps/storage.jsp"); </script>
    </div>

        
    