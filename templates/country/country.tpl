{include file="header.tpl"}
{include file="navigation.tpl"}
{literal}
<script type="text/javascript">
$(document).ready(function() {
$('input.country').typeahead({
  name: 'country',
  remote : 'ajax/country.php?query=%QUERY'

});
})
</script>
{/literal}
	<div class="row">
		<div class="col-lg-6" style="margin-top: 10px;">
			<div class="panel panel-info">
                <div class="panel-heading">
                    Add new country
                </div>
                <div class="panel-body">
            
					<form role="form" action="country.php?job=add" method="post">
	                    <div class="form-group">
	                        <input class="form-control country" name="country" value="{$country}" required placeholder="Country" autofocus="autofocus">
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
                    Nationalities
                </div>
                <div class="panel-body">
                    {php}list_country();{/php}
                </div>
                <div class="panel-footer">
                </div>
            </div>   
        </div>
   </div>
{include file="footer.tpl"}