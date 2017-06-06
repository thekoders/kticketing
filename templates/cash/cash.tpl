{include file="header.tpl"}
{include file="navigation.tpl"}
	<div class="row">
		<div class="col-lg-12" style="margin-top: 10px;">
			<div class="panel panel-primary">
                <div class="panel-heading">
                    Select Branch
                </div>
                <div class="panel-body">
            
					<form role="form" action="cash.php?job=list" method="post">
	                    <div class="row">
            			<div class="col-lg-10">
						<div class="form-group">
	                        <select class="form-control" name="branch" required>
		                    		{if $branch}
										<option value="{$branch}">{$branch}</option>
									{else}
										<option value="" disabled selected>Select A Branch</option>
									{/if}
									{section name=branch loop=$branches}
									<option value="{$branches[branch]}">{$branches[branch]}</option>
									{/section}
								</select>
	                    </div>
						</div>
            			<div class="col-lg-2">
	
							<button type="submit" name="ok" value="Go" class="btn btn-default">Go</button>
						</div>
						</div>           
                  
                   </form>
					{if $search}
					
					<form role="form" action="cash.php?job=list_full" method="post">
	                    <div class="row">
            			<div class="col-lg-5">
		                    <div class="form-group">
    							<div class="controls input-append date form_date" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
        							<input type="text" name="from_date" value="{$from_date}" readonly placeholder="From Date" style="width: 100%;">
        							<span class="add-on"><i class="icon-remove"></i></span>
									<span class="add-on"><i class="icon-th"></i></span>
    							</div>
								<input type="hidden" id="dtp_input1" value="" />
		                    </div>
		                </div>
						<div class="col-lg-5">
		                    <div class="form-group">
    							<div class="controls input-append date form_date" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
        							<input type="text" name="to_date" value="{$to_date}" readonly placeholder="To Date" style="width: 100%;">
        							<span class="add-on"><i class="icon-remove"></i></span>
									<span class="add-on"><i class="icon-th"></i></span>
    							</div>
								<input type="hidden" id="dtp_input1" value="" />
		                    </div>
		                </div>
						<div class="col-lg-2">
		                    <div class="form-group" id="returnDate" style="visibility:visible;">
    							<button type="submit" name="ok" value="Go" class="btn btn-default">LIST FULL</button>
		                    </div>
		                </div>
					</div>					               
                  
                   </form>
					{php}list_latest_activities($_SESSION['search_branch'], $_SESSION['from_date'], $_SESSION['to_date']);{/php}
					{/if}
                </div>
            </div>   
        </div>
   </div>
{include file="footer.tpl"}