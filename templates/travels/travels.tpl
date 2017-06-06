{include file="header.tpl"}
{include file="navigation.tpl"}
{literal}
<script type="text/javascript">
$(function() {
	
	//autocomplete
	$(".auto").autocomplete({
		source: "ajax/query_travels.php",
		minLength: 1
	});				

});
</script>



{/literal}

	<div class="row">
		<div class="col-lg-6" style="margin-top: 10px;">
			<div class="panel panel-info">
                <div class="panel-heading">
                    Add new Air Line
                </div>
                <div class="panel-body">
            
					<form role="form" action="travels.php?job=add" method="post">
	                    <div class="form-group">
	                        <input class="form-control" name="travels" value="{$travels}" required placeholder="Air Line" autofocus="autofocus">
	                    </div>
	
						{if $edit=='on'}
							<button type="submit" name="ok" value="Update" class="btn btn-default">Update</button>
						{else}
							<button type="submit" name="ok" value="Save" class="btn btn-default">Save</button>
						{/if}
	                    	<button type="reset" class="btn btn-default">Reset</button>                  
                  
                   </form>
				</div>
            </div>
	    </div>
	    
		<div class="col-lg-6">
			<div class="panel panel-red" style="margin-top: 10px;">
                <div class="panel-heading">
                    Air Lines
                </div>
                <div class="panel-body">
                    {php}list_travels();{/php}
                </div>
                <div class="panel-footer">
                </div>
            </div>   
        </div>
   </div>
{include file="footer.tpl"}